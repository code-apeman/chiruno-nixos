{ config, lib, pkgs, inputs, ... }: {
  services.dnsmasq.settings = {
    dhcp-option = [
      "6,192.168.1.1"
      "19,0"           # option ip-forwarding off
      "44,192.168.1.1"
      "45,0.0.0.0"     # netbios datagram distribution server
      "46,8"           # netbios node type
      "252,\"\\n\""
    ];
  };
}
