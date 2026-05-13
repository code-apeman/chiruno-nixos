{ config, lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      sudo = prev.sudo.override {
        withInsults = true;			# yes i have humiliation kink now please stfu
      };
    })
  ];
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
	  "systemd"
        ];
        theme = "agnoster";
      };
      interactiveShellInit = "fastfetch";	# that's how i like it
    };
    htop = {
      enable = true;
      settings = {
        hide_kernel_threads = true;
        hide_userland_threads = true;
      };
    };
  };
  console.packages = with pkgs; [
    terminus_font
  ];
  users.defaultUserShell = pkgs.zsh;		# my way or the highway
  environment.shells = [ pkgs.zsh ];		# the choice is yours
}
