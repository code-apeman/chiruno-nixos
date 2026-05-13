{ config, pkgs, inputs, ... }: {
  imports = [
     ./hyprland/env.nix
     ./hyprland/input.nix
     ./hyprland/monitors.nix
     ./hyprland/programs.nix
     ./hyprland/keybindings.nix
     ./hyprland/windowrules.nix
     ./hyprland/theme.nix
     ./hyprland/autostart.nix
     ./hyprland/polkit.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    package = null;
    portalPackage = null;

    systemd.enable = true;

    settings = {
      "$mainMod" = "SUPER";
      debug = {
        disable_logs = false;
	enable_stdout_logs = true;
      };
    };
  };
}

