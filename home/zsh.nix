{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    package = pkgs.emptyDirectory;
    oh-my-zsh = {
      enable = true;
      package = pkgs.emptyDirectory;
      theme = "agnoster";
      plugins = [
        "git"
      ];
    };
    shellAliases = {
      router = "ssh root@192.168.1.1";
    };
  };
}
