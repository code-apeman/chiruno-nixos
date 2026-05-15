{ config, lib, pkgs, ... }: {
  imports = [
    ./services/dnsmasq.nix
    ./services/agnos.nix
    ./services/nginx.nix
    ./services/mail.nix
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
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    gvfs.enable = true;				# Enable GVFS.
    atd.enable = true;
  };
}
