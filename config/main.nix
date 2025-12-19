{ config, lib, pkgs, inputs, ... }: {
  imports = [
      ./hardware.nix
      ./boot.nix
      ./networking.nix
      ./l10n.nix
      ./services.nix
      ./addpkgs.nix
  ];

  # We need a non-root admin account.
  users.users.ghostnoise = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];		# Enable ‘sudo’ for the user.
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;	# DEBIAN GTFO

  system = {
    copySystemConfiguration = true;	# Won't save from an oopsie, but whatever.
    stateVersion = "25.11";		# Do not change.
  };

}

