{ config, lib, pkgs, ... }: {
  imports = [
    ./networking/devnames.nix
    ./networking/interfaces.nix
    ./networking/xl2tpd-flexible.nix
    ./networking/wan.nix
    ./networking/finvpn.nix
    ./networking/rules.nix
  ];
  networking.hostName = "chiruno"; # Define your hostname.
  networking.networkmanager.enable = false;
  networking.dhcpcd.extraConfig = "nogateway";
}
