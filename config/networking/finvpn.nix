{ config, lib, pkgs, ... }: {
  networking.openconnect.interfaces.finvpn = {
    gateway = "vpn.ghostnoise.ru/?NekoNoAisu";
    passwordFile = "/etc/nixos/secrets/vpn-password";
    protocol = "anyconnect";
    user = "chiruno";
  };
}
