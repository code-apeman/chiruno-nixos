{ config, pkgs, ... }: {
  age.secrets.mailpassword.file = ../../secrets/mailpassword.age
  networking.firewall.allowedTCPPorts = [ 80 ];
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "admin@ghostnoise.ru";

  services.nginx.virtualHosts.${config.mailserver.fqdn}.enableACME = true;

  mailserver = {
    enable = true;
    stateVersion = 3;
    fqdn = "ghostnoise.ru";
    domains = [ "ghostnoise.ru" ];

    x509.useACMEHost = config.mailserver.fqdn;

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      "admin@ghostnoise.ru" = {
        hashedPasswordFile = config.age.secrets.mailpassword.path;
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
  };
}
