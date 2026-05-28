{ config, lib, pkgs, inputs, ... }: {
  imports = [
      ./hardware.nix
      ./boot.nix
      ./networking.nix
      ./l10n.nix
      ./services.nix
      ./addpkgs.nix
      ./desktop.nix
      ./fonts.nix
      ./shell.nix
  ];

  # We need a non-root admin account. Also, since the server is the main PC now, we REALLY need that account.
  users.users.ghostnoise = {
    uid = 1000;
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;	# DEBIAN GTFO

  system = {
    stateVersion = "25.11";		# Do not change.
  };

}

