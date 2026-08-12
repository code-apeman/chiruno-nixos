{ config, lib, pkgs, inputs, ... }: let
    mpvpaper-stop = pkgs.stdenv.mkDerivation {
      name = "mpvpaper-stop";
      version = "latest-commit";

      src = pkgs.fetchFromGitHub {
        owner = "pvtoari";
        repo = "mpvpaper-stop";
        rev = "fce30be5319a5039026e1b908c48b1509466ff5a";
        hash = "sha256-IN0K5lw7pEU4G+Hk/eBvF9qdlF7OMNPJcXDT/nbz/zg=";
      };
      
      nativeBuildInputs = with pkgs; [ meson ninja pkg-config ];
      buildInputs = with pkgs; [ cjson ];
    };
in {
  imports = [
    inputs.noctalia.nixosModules.default
  ];
 #nixpkgs.overlays = [ inputs.millennium.overlays.default ];
  services = {
    greetd = {	# Autologin
      enable = true;
      settings = {
        initial_session = {
          command = "uwsm start default";
          user = "ghostnoise";
        };
        default_session = {
          command = "uwsm start default";
          user = "ghostnoise";
        };
      };
    };
  };
  fonts.fontconfig = {
    allowBitmaps = true;
    allowType1 = true;
  };
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    steam = {
      enable = true;
     #package = (pkgs.millennium-steam.override {
     #  millennium = (inputs.millennium.packages.${pkgs.stdenv.hostPlatform.system}.millennium.override {
     #    bun = pkgs.bun.overrideAttrs (oldBun: {
     #      src = pkgs.fetchurl {
     #        url = "https://github.com/oven-sh/bun/releases/download/bun-v${oldBun.version}/bun-linux-x64-baseline.zip";
     #        hash = "sha256-nYokKSpwaAkCBdqsCloiP19pc29Sh+N7+I07QDHtx1A="; 
     #      };
     #    });
     #  });
     #});
     #gamescopeSession.enable = false;
    };
    firefox.enable = true;
    thunderbird.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      package = (
        pkgs.obs-studio.override {
          cudaSupport = true;
        }
      );
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-gstreamer
        obs-vkcapture
        obs-websocket
        obs-scale-to-sound
        obs-dvd-screensaver
        droidcam-obs
      ];
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      foot
      cava
      vlc
      mpv
      mpvpaper
      inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
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
      wineWow64Packages.staging
      retroarch-full
      pywalfox-native
      (discord.override {
        withOpenASAR = true;
        withEquicord = true;
      })
      imsprog
      milkytracker
      furnace
      zenity
      keepassxc
      neovim
    ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  # required for non-root IMSProg
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="5512", MODE="0666"
  '';
}
