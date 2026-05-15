{ config, pkgs, lib, ... }: {
  security.agnos = {
    enable = true;
    generateKeys.enable = true;
    settings = {
      accounts = [{
        certificates = [{
	    domains = [
              "ghostnoise.ru"
              "*.ghostnoise.ru"
            ];
	    fullchain_output_file = "fullchain.pem";
	    key_output_file = "privkey.pem";
	  }];
        email = "admin@ghostnoise.ru";
      }];
      dns_listen_addr = "217.25.239.233:53"; # set it to my public ip so it won't conflict with dnsmasq
    };
    temporarilyOpenFirewall = true;  };
}
