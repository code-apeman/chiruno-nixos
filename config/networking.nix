{ config, lib, pkgs, ... }: {
  networking.hostName = "chiruno"; # Define your hostname.
  networking.networkmanager.enable = false;
}
