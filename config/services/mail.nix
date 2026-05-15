{ config, pkgs, ... }: let
  agnosAccount = builtins.head config.security.agnos.settings.accounts;
  agnosCert = builtins.head agnosAccount.certificates;
in {
  age.secrets.mailpassword.file = ../../secrets/mailpassword.age;

  mailserver = {
    enable = true;
    stateVersion = 4;
    fqdn = "ghostnoise.ru";
    domains = [ "ghostnoise.ru" ];

    x509.certificateFile = agnosCert.fullchain_output_file;
    x509.privateKeyFile = agnosCert.key_output_file;

    loginAccounts = {
      "admin@ghostnoise.ru" = {
        hashedPasswordFile = config.age.secrets.mailpassword.path;
        aliases = [
          "postmaster@ghostnoise.ru"
          "webmaster@ghostnoise.ru"
          "security@ghostnoise.ru"
          "employment@ghostnoise.ru"
          "billing@ghostnoise.ru"
          "dev@ghostnoise.ru"
        ];
      };
      "spam@ghostnoise.ru".hashedPasswordFile = config.age.secrets.mailpassword.path;
    };
  };
}
