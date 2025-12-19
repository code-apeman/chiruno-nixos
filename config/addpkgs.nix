{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    curl
    wget
    fastfetch
    git
    git-lfs
  ];
}
