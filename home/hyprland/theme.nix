{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland.settings = {
   #animations.enabled = false;

    # The gaps between windows, as well as border colors.
    # proportional to the taskbar values.
    general = {
        # Inner and Outer gaps between windows.
        gaps_in = 5;
        gaps_out = 10;
    
        # I prefer a thin border
       #border_size = 1;
    
        # Border colors.
       #"col.active_border" = "rgb(d8d8d8)";
       #"col.inactive_border" = "rgb(9b9b9b)";
    
        # Set to true enable resizing windows by clicking and dragging on borders and gaps
       #resize_on_border = true;
    
       #layout = "dwindle";
    
        # READ https://wiki.hyprland.org/Configuring/Tearing/ BEFORE TURNING ON!
       #allow_tearing = false;
    };
    
    # Window Decorations! Shadow, Blur, etc.
    decoration = {
        rounding = 20;
        rounding_power = 2;
    
        # I want transparancy to not change, since we have the colored border.
       #active_opacity = 1;
       #inactive_opacity = 1;
    
        # Window Shadow
        "shadow:enabled" = true;
        "shadow:range" = 4;
        "shadow:render_power" = 3;
        "shadow:color" = "rgba(1a1a1aee)";
       #"shadow:range" = 2;
       #"shadow:render_power" = 5;
       #"shadow:sharp" = false;
       #"shadow:color" = "rgba(0,0,0,0.85)";
       #"shadow:ignore_window" = true;
       #"shadow:offset" = "2 2";
       #"shadow:scale" = 1;
       
    
        # Transparent Window Blur
       #"blur:enabled" = false;
        "blur:enabled" = true;
	"blur:size" = 3;
        "blur:passes" = 2;
        "blur:vibrancy" = 0.1696;
    };
    
    # Read https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more info on dwindle layout.
    dwindle = {
        pseudotile = true;
        preserve_split = true;
    };

    layerrule = {
      name = "noctalia";
      "match:namespace" = "noctalia-background-.*$";
      ignore_alpha = 0.5;
      blur = true;
      blur_popups = true;
    };

    # Read https://wiki.hyprland.org/Configuring/Master-Layout/ for more info on master layout.
    master = {
        new_status = "master";
    };
    
    # We have our own wallpapers :) So I'll disable default things.
    misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
    };

    source = [
      "~/.config/hypr/noctalia/noctalia-colors.conf"
    ];
  };
}
