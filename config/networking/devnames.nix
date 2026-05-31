{ config, lib, pkgs, ... }: {
  # Define custom device names for NICs
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:03:00.0", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="swnic"
    ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:04:00.0", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="wannic"
    ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:06:06.0", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="pcibotnic"
    ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:06:07.0", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000", NAME="pcitopnic"
  '';
}
