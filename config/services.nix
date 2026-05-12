{ config, lib, pkgs, ... }: {
  imports = [
    ./services/nginx.nix
#    ./services/mail.nix
    ./services/gitlab.nix
    ./services/sharkey.nix
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
