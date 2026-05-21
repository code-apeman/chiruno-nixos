{ config, pkgs, lib, ... }: {
  networking.firewall.extraCommands = ''
    iptables -t nat -A POSTROUTING -o wannic -j MASQUERADE
    iptables -t nat -A POSTROUTING -o wan -j MASQUERADE
    iptables -t nat -A POSTROUTING -o finvpn -j MASQUERADE
    iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    iptables -A FORWARD -i lan -o wannic -j ACCEPT
    iptables -A FORWARD -i lan -o wan -j ACCEPT
    iptables -A FORWARD -i lan -o finvpn -j ACCEPT
    iptables -t mangle -A POSTROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
  '';
}
