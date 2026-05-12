{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  
  hardware = {
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580
      open = false;
    }
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  boot = {
    initrd = {
      availableKernelModules = [ "ehci_pci" "ahci" ];
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/e915dc15-08e3-4553-8925-6f241f6284bb";
      fsType = "btrfs";
      options = [ "compression=zstd:3" ];
    };

    "/etc/nixos" = {
      device = "/dev/disk/by-uuid/1091-4C20";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/7DA6-A424";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/e413685c-245a-4fa2-97d5-b8cd6d99fa1f";
      fsType = "btrfs";
      options = [ "compression=zstd:3" ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/ddf8671a-1ea5-455c-b29e-f7049baf161b"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
