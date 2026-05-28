{ config, pkgs, inputs, ... }: {
  imports = [
    ./git.nix
    ./noctalia.nix
    ./obs.nix
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
}
