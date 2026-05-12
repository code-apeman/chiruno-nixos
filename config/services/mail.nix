{ config, pkgs, ... }: {
  networking.firewall.allowedTCPPorts = [ 80 ];
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "admin@ghostnoise.ru";

  services.nginx.virtualHosts.${config.mailserver.fqdn}.enableACME = true;

  mailserver = {
    enable = true;
    stateVersion = 3;
    fqdn = "ghostnoise.ru";
    domains = [ "ghostnoise.ru" ];

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      "admin@ghostnoise.ru" = {
        hashedPasswordFile = "/etc/nixos/secrets/mailpassword";
        aliases = [
          "postmaster@ghostnoise.ru"
          "webmaster@ghostnoise.ru"
          "security@ghostnoise.ru"
          "employment@ghostnoise.ru"
          "billing@ghostnoise.ru"
          "spam@ghostnoise.ru"
          "dev@ghostnoise.ru"
        ];
      };
    };

    # Use Let's Encrypt certificates. Note that this needs to set up a stripped
    # down nginx and opens port 80.
    certificateScheme = "acme-nginx";
  };
}
