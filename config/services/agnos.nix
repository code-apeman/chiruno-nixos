{ config, pkgs, lib, ... }: {
  security.agnos = {
    enable = true;
    generateKeys.enable = true;
    group = config.services.nginx.group;
    accounts.ghostnoise = {
      certificates."ghostnoise.ru".domains = [
        "ghostnoise.ru"
        "*.ghostnoise.ru"
      ];
      email = "admin@ghostnoise.ru";
    };
    dns_listen_addr = "217.25.239.233:53"; # set it to my public ip so it won't conflict with dnsmasq
    temporarilyOpenFirewall = true;
  };
}
