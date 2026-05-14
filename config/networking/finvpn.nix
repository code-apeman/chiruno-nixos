{ config, lib, pkgs, ... }: {
  age.secrets.vpn-password.file = ../../secrets/vpn-password.age;
  networking.openconnect.interfaces.finvpn = {
    gateway = "vpn.ghostnoise.ru/?NekoNoAisu";
    passwordFile = config.age.secrets.vpn-password.path;
    protocol = "anyconnect";
    user = "chiruno";
  };
}
