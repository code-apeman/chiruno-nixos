{ config, pkgs, inputs, ... }: {
  services.hyprpolkitagent = {
    enable = true;
   #package = pkgs.emptyDirectory;	# for some reason the systemd unit generator takes this statement LITERALLY so once again, DRY can suck my shiny-
  };
}
