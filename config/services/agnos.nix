{ config, pkgs, lib, ... }: {
  users.groups.ssl = {};
  age.secrets.agnosprivkey = {
    file = ../../secrets/agnosprivkey.age;
    owner = "agnos";
    group = "ssl";
  };
  security.agnos = {
    enable = true;
    group = "ssl";
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
      dns_listen_addr = "217.25.239.233:53";
    };
    temporarilyOpenFirewall = true;
  };
}
