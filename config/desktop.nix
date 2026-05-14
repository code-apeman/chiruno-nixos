{ config, lib, pkgs, inputs, ... }: {
  imports = [
    inputs.noctalia.nixosModules.default
  ];
  nixpkgs.overlays = [ inputs.millennium.overlays.default ];
  services = {
    greetd = {	# Autologin
      enable = true;
      settings = {
        initial_session = {
          command = "start-hyprland";
          user = "ghostnoise";
        };
        default_session = {
          command = "start-hyprland";
          user = "ghostnoise";
        };
      };
    };
    noctalia-shell.enable = true;
  };
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
    };
    firefox.enable = true;
    thunderbird.enable = true;
  };
  environment = {
    systemPackages = with pkgs; [
     #inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default	# glutonous af
      foot
      cava
      vlc
      mpv
      mpvpaper
      inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
     #inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
     #hyprpicker
     #hyprpaper
      hyprshot
      kdePackages.gwenview
      kdePackages.ark
      krita
      gimp
      nemo
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      ayugram-desktop
      prismlauncher
      pavucontrol
      wineWowPackages.waylandFull
      retroarch-full
      pywalfox-native
    ];
  };
 #nix.settings = {
 #  substituters = [
 #   #"https://hyprland.cachix.org"
 #    "https://cache.garnix.io"
 #  ];
 #  trusted-substituters = [	# DRY can suck my big shiny-
 #   #"https://hyprland.cachix.org"
 #    "https://cache.garnix.io"
 #  ];
 #  trusted-public-keys = [
 #   #"hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
 #    "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
 #  ];
 #};
}
