{ config, lib, pkgs, ... }: {
  networking = {
    useDHCP = false;
    bridges.lan.interfaces = [
      "swnic"
      "pcitopnic"
      "pcibotnic"
    ];
    interfaces = {
      lan.ipv4.addresses = [{
        address = "192.168.1.1";
        prefixLength = 24;
      }];
      wannic.useDHCP = true;
    };
    firewall.trustedInterfaces = [ "lan" "swnic" "pcibotnic" "pcitopnic" ];
  };
}
