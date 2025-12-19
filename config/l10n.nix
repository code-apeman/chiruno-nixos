{ config, lib, pkgs, ... }: {
  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "ter-u12n";
    keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };
}
