{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland.settings.env = [
    "XCURSOR_SIZE,32"
    "XCURSOR_THEME,Marisa"
  
    "XDG_SESSION_TYPE,wayland"
  
    # electron apps are best when rendered natively >v<
    "ELECTRON_OZONE_PLATFORM_HINT,auto"
  
    "QT_QPA_PLATFORMTHEME,qt5ct"
  ];
}
