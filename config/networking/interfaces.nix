{ config, lib, pkgs, ... }: {
  networking.useDHCP = false;
  networking.bridges.lan.interfaces = [
    "swnic"
    "pcitopnic"
    "pcibotnic"
  ];
  networking.interfaces = {
    lan.addresses = {
      address = "192.168.1.1";
      prefixLength = 24;
    };
    wannic.useDHCP = true;
  };
}
