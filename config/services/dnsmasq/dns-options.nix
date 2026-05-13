{ config, lib, pkgs, inputs, ... }: {
  services.dnsmasq.settings = {
    server = [
      "127.0.0.1#5053"
      "/freedom/195.98.64.65"
      "/freedom/195.98.64.66"
      "/freedom-vrn.ru/195.98.64.65"
      "/freedom-vrn.ru/195.98.64.66"
    ];
    address= [
      "/chiruno.local/192.168.1.1"
      "/suckless.local/192.168.1.2"
      "/bocchi.local/192.168.1.4"
    ];
    selfmx = true;
    local = [ "/local/" ];
    domain = [ "local" ];
    expand-hosts = true;
  };
}
