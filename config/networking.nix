{ config, lib, pkgs, ... }: {
  imports = [
    ./networking/devnames.nix
    ./networking/interfaces.nix
    ./networking/wan.nix
  ];
  networking.hostName = "chiruno"; # Define your hostname.
  networking.networkmanager.enable = false;
}
