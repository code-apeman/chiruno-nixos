{ config, lib, pkgs, inputs, ... }: {
  services.dnsmasq.settings = {
    enable-tftp = true;
    tftp-root = [ "/srv/tftp" ];

    # Determine client type...
    dhcp-match = [
      "set:efi-x86_64,option:client-arch,7"
      "set:efi-x86_64,option:client-arch,9"
      "set:efi-x86,option:client-arch,6"
    ];
    # ...and use the appropriate boot file
    dhcp-boot = [
      "tag:efi-x86_64,ipxe_amd64.efi"
      "tag:efi-x86,ipxe_ia32.efi"
      # Fallback (for x86 Legacy BIOS, although ARM and RISC-V clients would also get this file)
      "undionly-nbxyz.kpxe"
    ];
  };
}
