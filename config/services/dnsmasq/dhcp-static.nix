{ config, lib, pkgs, inputs, ... }: {
  services.dnsmasq.settings = {
    dhcp-host = [
      "00:19:99:20:f0:ec,suckless,192.168.1.2,infinite"
      "064:ae:f1:25:cd:90,tenna,192.168.1.10,infinite"
    ];
  };
}
