{ config, lib, pkgs, ... }: {
  services = {
    xl2tpd = {
      enable = true;
      extraXl2tpOptions = ''
        [lac wan]
        lns = l2tp.freedom
        redial = yes
        redial timeout = 5
        require chap = yes
        require authentication = no
        ppp debug = yes
        require pap = no
        autodial = yes
      '';
    };
    pppd = {
      enable = true;
      peers.wan = {
        enable = true;
	config = ''
          ipcp-accept-local
          ipcp-accept-remote
          refuse-eap
          refuse-mschap-v2
          require-chap
          #noccp
          noauth
          idle 1800
          mtu 1456
          mru 1456
          defaultroute
          debug
          ifname wan
          connect-delay 5000
          name pwg02569
          remotename FreedomCHAP
	'';
      };
    };
  };
}
