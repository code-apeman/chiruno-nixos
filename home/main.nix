{ config, pkgs, inputs, ... }: {
  imports = [
    ./git.nix
    ./hyprland.nix
    ./noctalia.nix
    ./zsh.nix
    ./kitty.nix
    inputs.nixcord.homeModules.nixcord
    ./nixcord.nix
    ./obs.nix
    ./gtk.nix
    ./nemo.nix
  ];

  home = {
    username = "ghostnoise";
    homeDirectory = "/home/ghostnoise";
    stateVersion = "25.05";

    packages = with pkgs; [
      go-2fa
    ];

    file = {
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
  nixpkgs.config.allowUnfree = true;  # BEGONE DEBIAN
}
