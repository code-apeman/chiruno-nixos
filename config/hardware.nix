{ config, lib, pkgs, modulesPath, ... }: let
  uidParameter = "uid=" + ${toString users.users.ghostnoise.uid};
  gidParameter = "gid=" + ${toString users.groups.wheel.gid};
in {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  
  hardware = {
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
      open = false;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  boot = {
    initrd = {
      availableKernelModules = [ "ahci" "ohci_pci" "ehci_pci" "xhci_pci" "nvme" "usbhid" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/e915dc15-08e3-4553-8925-6f241f6284bb";
      fsType = "btrfs";
      options = [ "compress=zstd:3" ];
    };

    "/etc/nixos" = {
      device = "/dev/disk/by-uuid/2B37-F689";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" uidParameter gidParameter ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/7D46-A424";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/e413685c-245a-4fa2-97d5-b8cd6d99fa1f";
      fsType = "btrfs";
      options = [ "compress=zstd:3" ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/583c94d0-c7c9-49ca-8015-b04dd7b6c5f8"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
