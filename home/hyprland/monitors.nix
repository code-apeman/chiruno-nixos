{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "LVDS-1,1600x900@59.99,0x0,1"
    ];
  };
}
