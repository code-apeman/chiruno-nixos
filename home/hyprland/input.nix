{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "eu,ru";
      kb_options = "grp:alt_shift_toggle, compose:menu";
    };
  };
}
