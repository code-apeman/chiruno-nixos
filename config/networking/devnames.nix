{ config, lib, pkgs, ... }: {
  # Define custom device names for NICs
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="b812", ATTRS{speed}=="480",  ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="wlan2g"
    ACTION=="add", SUBSYSTEM=="net", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="b812", ATTRS{speed}=="5000", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="wlan5g"
    ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:03:00.0", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="swnic"
    ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:04:00.0", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="wannic"
    ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:06:07.0", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="pcinic"
  '';
}
