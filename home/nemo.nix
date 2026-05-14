{ config, pkgs, inputs, ... }: {
  dconf = {
      settings = {
          "org/cinnamon/desktop/applications/terminal" = {
              exec = "foot";
              # exec-arg = "";
          };
      };
  };
}
