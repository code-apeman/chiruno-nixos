{ config, lib, pkgs, inputs, ... }: {
  services.dnsmasq.settings = {
    server = [
      "9.9.9.9"
      "149.112.112.112"
      "/freedom/195.98.64.65"
      "/freedom/195.98.64.66"
      "/freedom-vrn.ru/195.98.64.65"
      "/freedom-vrn.ru/195.98.64.66"
    ];
    address = [
      "/chiruno.local/192.168.1.1"
    ];
    selfmx = true;
    local = [ "/local/" ];
    domain = [ "local" ];
    no-hosts = true;
  };
}
