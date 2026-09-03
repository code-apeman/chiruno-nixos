{ config, pkgs, lib, ... }: {
  users.groups.ssl = {};
  age.secrets.desectoken = {
    file = ../../secrets/desectoken.age;
    owner = "acme";
    group = "ssl";
  };
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "admin@ghostnoise.ru";
      dnsProvider = "desec";
	    environmentFile = config.age.secrets.desectoken.path;
      group = "ssl";
    };
    certs."ghostnoise.ru".extraDomainNames = [
      "*.ghostnoise.ru"
    ];
  };
}
