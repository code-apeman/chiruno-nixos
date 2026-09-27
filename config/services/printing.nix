{ config, lib, pkgs, inputs, ... }: {
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
    printing = {
      listenAddresses = [ "192.168.1.1:631" "127.0.0.1:631" ];
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
    };
  };
}
