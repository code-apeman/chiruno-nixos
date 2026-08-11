{ config, lib, pkgs, inputs, ... }: let
  countryCode = "RU";
  apnet = {
    ssid = "Chiruno";
    authentication = {
      mode = "wpa2-sha256";
      wpaPasswordFile = config.age.secrets.wifikey.path;
    };
    settings.bridge = "lan";
  };
in {
  age.secrets.wifikey.file = ../../secrets/wifikey.age;

  services.hostapd = {
    enable = true;
    radios = {
      wlan2g = {
        inherit countryCode;
        band = "2g";
        channel = 1;
        networks.wlan2g = apnet;
      };
      wlan5g = {
        inherit countryCode;
        band = "5g";
        channel = 165;
        networks.wlan5g = apnet;
      };
    };
  };
}
