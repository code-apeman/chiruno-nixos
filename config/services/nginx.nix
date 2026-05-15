{ config, lib, pkgs, inputs, ... }: {
  services = {
    nginx = {
      group = "ssl";
      enable = true;
      virtualHosts = {
        "www.ghostnoise.ru" = {
	  sslCertificate = config.security.agnos.settings.accounts."ghostnoise".certificates."ghostnoise.ru".fullchain_output_file;
	  sslCertificateKey = config.security.agnos.settings.accounts."ghostnoise".certificates."ghostnoise.ru".key_output_file;
          forceSSL = true;
          root = "/srv/http/home";
        };
      };
    };
    phpfpm.pools = {
      homepage = {
        user = "nobody";
	settings = {
          "pm" = "dynamic";
          "listen.owner" = config.services.nginx.user;
          "pm.max_children" = 5;
          "pm.start_servers" = 2;
          "pm.min_spare_servers" = 1;
          "pm.max_spare_servers" = 3;
          "pm.max_requests" = 500;
        };
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
