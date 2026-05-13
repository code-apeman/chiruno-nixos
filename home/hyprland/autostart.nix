{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland = {
    systemd.enableXdgAutostart = true;
    settings.exec-once = [
      "wl-paste --watch cliphist store"
     #"quickshell"
    ];
  };
}
