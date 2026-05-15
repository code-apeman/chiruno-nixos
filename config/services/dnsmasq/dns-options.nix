{ config, lib, pkgs, inputs, ... }: {
  services.dnsmasq.settings = {
    server = [
      "1.1.1.1"
      "1.0.0.1"
      "/freedom/195.98.64.65"
      "/freedom/195.98.64.66"
      "/freedom-vrn.ru/195.98.64.65"
      "/freedom-vrn.ru/195.98.64.66"
    ];
    address= [
      "/chiruno.local/192.168.1.1"
      "/suckless.local/192.168.1.2"
    ];
    selfmx = true;
    local = [ "/local/" ];
    domain = [ "local" ];
    expand-hosts = true;
  };
}
