{ config, pkgs, inputs, ... }: {
  programs.nixcord = {
    enable = true;
    discord = {
      enable = true;
      equicord.enable = true;
      vencord.enable = false;
    };
  };
}
