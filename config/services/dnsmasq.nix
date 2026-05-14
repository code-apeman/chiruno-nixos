{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./dnsmasq/dhcp-options.nix
    ./dnsmasq/dhcp-static.nix
    ./dnsmasq/dns-options.nix
    ./dnsmasq/netboot.nix
  ];
  services.dnsmasq = {
    enable = true;
    settings = {
      domain-needed = true;
      listen-address = [ "127.0.0.1,192.168.1.1,192.168.69.1" ];
      dhcp-range = [ "192.168.1.100,192.168.1.200,12h" ];
  
      dhcp-name-match = [ "set:wpad-ignore,wpad" ];
      dhcp-ignore-names = [ "tag:wpad-ignore" ];
    };
  };
}
