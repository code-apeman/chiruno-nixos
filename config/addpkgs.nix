{ config, lib, pkgs, ... }: {
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
  ];
}
