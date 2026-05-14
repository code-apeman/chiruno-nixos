{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
    neovim
    curl
    wget
    fastfetch
    git
    git-lfs
    yt-dlp
    jq
    ffmpeg
    mpg123
    wl-clipboard
    mako
    socat
    brightnessctl
    pulsemixer
    rar
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
