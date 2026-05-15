{ config, pkgs, ... }: {
  age.secrets.mailpassword.file = ../../secrets/mailpassword.age;

  mailserver = {
    enable = true;
    stateVersion = 4;
    fqdn = "ghostnoise.ru";
    domains = [ "ghostnoise.ru" ];

    x509.certificateFile = config.security.agnos.settings.accounts."ghostnoise".certificates.${config.mailserver.fqdn}.fullchain_output_file;
    x509.privateKeyFile = config.security.agnos.settings.accounts."ghostnoise".certificates.${config.mailserver.fqdn}.key_output_file;

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
