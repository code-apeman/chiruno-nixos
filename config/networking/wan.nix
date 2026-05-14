{ config, lib, pkgs, ... }: {
  environment.etc.chap-secrets = {
    enable = true;
    target = "ppp/chap-secrets";
    owner = "root";
    group = "root";
    mode = "0600";
  };
  services.xl2tpd-flexible = {
    enable = true;
    xl2tpOptions = ''
      [global]
      access control = no
      auth file = /etc/ppp/chap-secrets
      debug avp = no
      debug network = no
      debug packet = no
      debug state = no
      debug tunnel = no
      
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
    pppOptions = ''
      ipcp-accept-local
      ipcp-accept-remote
      refuse-eap
      refuse-mschap-v2
      require-chap
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
}
