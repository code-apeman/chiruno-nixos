{ config, lib, pkgs, inputs, ... }: let
    mpvpaper-stop = pkgs.stdenv.mkDerivation {
      name = "mpvpaper-stop";
      version = "latest-commit";

      src = pkgs.fetchFromGitHub {
        owner = "pvtoari";
        repo = "mpvpaper-stop";
        rev = "fce30be5319a5039026e1b908c48b1509466ff5a";
        hash = "sha256-fce30be5319a5039026e1b908c48b1509466ff5a";
      };
      
      nativeBuildInputs = with pkgs; [ meson ninja pkg-config ];
      buildInputs = with pkgs; [ cjson ];
    };
in {
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
      aseprite
      nemo
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      mpvpaper
      mpvpaper-stop
      ayugram-desktop
      prismlauncher
      pavucontrol
      wineWow64Packages.stable
      retroarch-full
      pywalfox-native
      equicord
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
