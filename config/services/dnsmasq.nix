{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./dnsmasq/dhcp-options.nix
    ./dnsmasq/dhcp-static.nix
    ./dnsmasq/dns-options.nix
    ./dnsmasq/netboot.nix
  ];
  services = {
    dnsmasq = {
      enable = true;
      settings = {
        dhcp-range = "192.168.1.100,192.168.1.200,12h";
    
        dhcp-name-match = [ "set:wpad-ignore,wpad" ];
        dhcp-ignore-names = [ "tag:wpad-ignore" ];
        dhcp-authoritative = true;
      };
    };
    resolved.enable = false;
  };
}
