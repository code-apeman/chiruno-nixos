{ config, lib, pkgs, inputs, ... }: let
  agnosAccount = builtins.head config.security.agnos.settings.accounts;
  agnosCert = builtins.head agnosAccount.certificates;
in {
  services = {
    sharkey = {
      enable = true;
      settings = {
        url = "https://fedi.ghostnoise.ru";
        socket = "/run/sharkey/sharkey.sock";
        chmodSocket = "777";
      };
    };
    nginx.virtualHosts."fedi.ghostnoise.ru" = {
      sslCertificate = "/var/lib/agnos/" + agnosCert.fullchain_output_file;
      sslCertificateKey = "/var/lib/agnos/" + agnosCert.key_output_file;
      forceSSL = true;
      http2 = true;
      locations = {
        "/" = {
          proxyPass = "http://unix:${config.services.sharkey.settings.socket}";
          proxyWebsockets = true;
          recommendedProxySettings = false;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_redirect off;

            # If it's behind another reverse proxy or CDN, remove the following.
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
          '';
        };
      };
    };
  };
  systemd.services.nginx.serviceConfig.ProtectHome = false;
  # let me just broadcast my L OpSec rq
  nixpkgs.config.permittedInsecurePackages = [
    "pnpm-10.34.0"
  ];
}
