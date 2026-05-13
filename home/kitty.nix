{ config, pkgs, inputs, ... }: {
  programs.kitty = {
    enable = true;
    package = null;
    font = {
      name = "Maple Mono NF CN";
      size = 11.0;
    };
    settings = {
      include = "~/.config/kitty/themes/noctalia.conf";
      background_opacity = 0.65;
      cursor_trail = 1;
    };
    shellIntegration.enableZshIntegration = true;
  };
}
