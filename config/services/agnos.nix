{ config, pkgs, lib, ... }: {
  age.secrets.agnosprivkey = {
    file = ../../secrets/agnosprivkey.age;
    owner = "agnos";
    group = "agnos";
  };
  security.agnos = {
    enable = true;
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
	private_key_path = config.age.secrets.agnosprivkey.path;
      }];
      dns_listen_addr = "127.0.0.1:42069";  # per my dnsmasq config
    };
  };
}
