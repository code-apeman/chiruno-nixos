{ config, lib, pkgs, inputs, ... }: let
  agnosAccount = builtins.head config.security.agnos.settings.accounts;
  agnosCert = builtins.head agnosAccount.certificates;
in {
  services = {
    fcgiwrap.instances.homepage = {
      socket = {
        user = "nginx";
        group = "nginx";
      }
      process.user = "nginx";
    };
    nginx = {
      enable = true;
      group = "ssl";
      virtualHosts = {
        "www.ghostnoise.ru" = {
          sslCertificate = "/var/lib/agnos/" + agnosCert.fullchain_output_file;
          sslCertificateKey = "/var/lib/agnos/" + agnosCert.key_output_file;
          forceSSL = true;
          root = "/srv/http/home";
          locations = {
            "~ \\.php$".extraConfig = ''
              fastcgi_pass  unix:${config.services.phpfpm.pools.homepage.socket};
              fastcgi_index index.php;
            '';
            "/cgi-bin/".extraConfig = ''
              fastcgi_pass unix:${config.services.fcgiwrap.instances.homepage.socket,address};
              include      ${pkgs.nginx}/conf/fastcgi_params;
            '';
            "/uploads/".extraConfig = ''
              autoindex on;
              autoindex_localtime on;
              autoindex_exact_size off;
            '';
            "/guide".index = "how-to-kys.mp4";
          };
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
