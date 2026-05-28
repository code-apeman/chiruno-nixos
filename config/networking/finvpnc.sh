VPN_INTERNAL_GATEWAY="172.20.0.1"
EXTRA_RANGES=(
    "91.108.56.0/22"
    "91.108.4.0/22"
    "91.108.8.0/22"
    "91.108.16.0/22"
    "91.108.12.0/22"
    "149.154.160.0/20"
    "91.105.192.0/23"
    "91.108.20.0/22"
    "185.76.151.0/24"
)

pre_init() {
	echo "$TUNDEV pre-init"
	if (exec 6< /dev/net/tun) > /dev/null 2>&1 ; then
		:
	else # can't open /dev/net/tun
		test -e /proc/sys/kernel/modprobe && `cat /proc/sys/kernel/modprobe` tun 2>/dev/null
		# make sure tun device exists
		if [ ! -e /dev/net/tun ]; then
			mkdir -p /dev/net
			mknod -m 0640 /dev/net/tun c 10 200
			[ -x /sbin/restorecon ] && /sbin/restorecon /dev/net/tun
		fi
		# workaround for a possible latency caused by udev, sleep max. 10s
		for x in $(seq 100) ; do
			(exec 6<> /dev/net/tun) > /dev/null 2>&1 && break;
			sleep 0.1
		done
	fi
}

connect() {
	echo "$TUNDEV connect"
	if [ -n "$INTERNAL_IP4_MTU" ]; then
		MTU=$INTERNAL_IP4_MTU
	else
		MTUDEV=`ip route get "$VPNGATEWAY" | sed -ne 's/^.*dev \([a-z0-9]*\).*$/\1/p'`
		MTU=`ip link show "$MTUDEV" | sed -ne 's/^.*mtu \([[:digit:]]\+\).*$/\1/p'`
		if [ -n "$MTU" ]; then
			MTU=`expr $MTU - 88`
		fi
	fi

	if [ -z "$MTU" ]; then
		MTU=1412
	fi

	# Point to point interface require a netmask of 255.255.255.255 on some systems
	ip link set dev "$TUNDEV" up mtu "$MTU"
	ip addr add "$INTERNAL_IP4_ADDRESS/32" peer "$INTERNAL_IP4_ADDRESS" dev "$TUNDEV"

	if [ -n "$INTERNAL_IP4_NETMASK" ]; then
		ip route replace "$INTERNAL_IP4_NETADDR/$INTERNAL_IP4_NETMASKLEN" dev "$TUNDEV"
	fi

	echo $TUNDEV > /run/occlient.tundev
	iptables -t nat -A POSTROUTING -o $TUNDEV -j MASQUERADE
	#iptables -A DOCKER-USER -i lan -o $TUNDEV -j ACCEPT ||\
	iptables -A FORWARD -i lan -o $TUNDEV -j ACCEPT
    CIDR_REGEX='(((25[0-5]|2[0-4][0-9]|1?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|1?[0-9][0-9]?))(\/([8-9]|[1-2][0-9]|3[0-2]))([^0-9.]|$)'
    ADDR_REGEX='^(0*(1?[0-9]{1,2}|2([0-4][0-9]|5[0-5]))\.){3}0*(1?[0-9]{1,2}|2([‌0-4][0-9]|5[0-5]))$'
	for subnet in $(curl -fsSL https://raw.githubusercontent.com/bol-van/rulist/refs/heads/main/reestr_smart4.txt https://raw.githubusercontent.com/medvedeff-true/ru-gaming-blocklist/refs/heads/main/medvedeff-game-ipset.txt | dos2unix); do
		#echo "Adding ${subnet} to IP routing table..."
        if [[ $subnet =~ $CIDR_REGEX ]] || [[ $subnet =~ $ADDR_REGEX ]]; then
            ip route add ${subnet} via $VPN_INTERNAL_GATEWAY dev $TUNDEV || echo "^^^ Adding ${subnet} failed. ^^^"
        else
            echo "${subnet} is not a valid IPv4 CIDR"
        fi
	done
	for subnet in "${EXTRA_RANGES[@]}"; do
		#echo "Adding ${subnet} to IP routing table..."
		ip route add ${subnet} via $VPN_INTERNAL_GATEWAY dev $TUNDEV || echo "^^^ Adding ${subnet} failed..."
	done
	echo "All routes added, VPN connection established."
}

disconnect() {
	echo "$TUNDEV disconnect"
	rm -f /run/occlient.tundev
	iptables -t nat -D POSTROUTING -o $TUNDEV -j MASQUERADE
	iptables -D DOCKER-USER -i $DEFAULT_LAN -o $TUNDEV -j ACCEPT
	iptables -D FORWARD -i $DEFAULT_LAN -o $TUNDEV -j ACCEPT
	ip route del "$VPNGATEWAY"
}

reconnect() {
	echo "$TUNDEV reconnect"
}

attempt_reconnect() {
	echo "$TUNDEV attempt-reconnect"
}


if [ -z "$reason" ]; then
	echo "this script must be called from openconnect" 1>&2
	exit 1
fi

case "$reason" in
	pre-init)
		pre_init
		;;
	connect)
		connect
		;;
	disconnect)
		disconnect
		;;
	attempt-reconnect)
		# Invoked before each attempt to re-establish the session.
		# If the underlying physical connection changed, we might
		# be left with a route to the VPN server through the VPN
		# itself, which would need to be fixed.
		attempt_reconnect
		;;
	reconnect)
		# After successfully re-establishing the session.
		reconnect
		;;
	*)
		echo "unknown reason '$reason'. Maybe vpnc-script is out of date" 1>&2
		exit 1
		;;
esac

exit 0
