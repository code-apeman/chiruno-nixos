{ config, lib, pkgs, inputs, ... }: let
  agnosAccount = builtins.head config.security.agnos.settings.accounts;
  agnosCert = builtins.head agnosAccount.certificates;
in {
  services = {
    nginx = {
      enable = true;
      virtualHosts = {
        "www.ghostnoise.ru" = {
	  sslCertificate = agnosCert.fullchain_output_file;
	  sslCertificateKey = agnosCert.key_output_file;
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
