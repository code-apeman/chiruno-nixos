{ config, lib, pkgs, ... }: {
  imports = [
    ./services/nginx.nix
    ./services/mail.nix
    ./services/gitlab.nix
    ./services/mastodon.nix
  ];
  services = {
    openssh = {
      enable = true;
    };
    printing = {
      enable = true;
    };
  };
}
