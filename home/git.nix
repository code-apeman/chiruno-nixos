{ config, pkgs, inputs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.emptyDirectory;
    settings = {
      user = {
        name = "GhostNoise";
        email = "dev@ghostnoise.ru";
      };
    };
    lfs = {
      enable = true;
      package = pkgs.emptyDirectory;
    };
  };
}
