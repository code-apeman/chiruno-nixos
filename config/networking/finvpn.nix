{ config, lib, pkgs, ... }: {
  nixpkgs.overlays = [ (final: prev: {
    finvpnc = final.writeShellApplication {
      name = "finvpnc";
      runtimeInputs = with pkgs; [ curl iptables iproute2 ];
      text = ./finvpnc.sh;
    };
  }) ];
  age.secrets.vpn-password.file = ../../secrets/vpn-password.age;
  networking.openconnect.interfaces.finvpn = {
    gateway = "vpn.ghostnoise.ru/?NekoNoAisu";
    passwordFile = config.age.secrets.vpn-password.path;
    protocol = "anyconnect";
    user = "chiruno";
    extraOptions.script = "${pkgs.finvpnc}/bin/finvpnc";
  };
}
