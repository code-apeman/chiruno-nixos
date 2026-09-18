{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
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
    socat
    brightnessctl
    pulsemixer
    rar
    tmux
    psmisc
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
