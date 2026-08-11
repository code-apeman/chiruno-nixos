{ config, lib, pkgs, ... }: {
  nixpkgs.overlays = [ (final: prev: {
    finvpnc = final.writeShellApplication {
      name = "finvpnc";
      runtimeInputs = with pkgs; [ curl iptables iproute2 dos2unix iprange ];
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
  # fix an annoying thing that the VPN will try to start when internet is unavailable, fail and give up
  systemd.services.openconnect-finvpn.serviceConfig.ExecStartPre = pkgs.writeShellScript "wait-for-finvpn" ''
    echo "Waiting for VPN server to respond to ping..."
    until ${pkgs.iputils}/bin/ping -c1 -W2 vpn.ghostnoise.ru >/dev/null 2>&1; do
      sleep 1
    done
    echo "Server reachable, starting VPN..."
  '';
}
