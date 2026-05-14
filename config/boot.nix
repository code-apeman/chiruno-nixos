{ config, lib, pkgs, ... }: {
  boot = {
    initrd.systemd.enable = true;
    loader = {
      systemd-boot.enable = true;		# Use the systemd-boot EFI boot loader.
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    consoleLogLevel = 3;
    kernelParams = [
      "splash"
      "boot.shell_on_fail"
      "mitigations=off"
    ];
    kernel.sysctl = {
      "net.ipv4.ip_forward" = true;
      "net.ipv4.conf.all.forwarding" = true;
      "net.ipv6.conf.all.forwarding" = true;
    };
  };
}
