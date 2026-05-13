{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod SHIFT, Q, killactive,"
      "$mainMod SHIFT, E, exec, noctalia-shell ipc call sessionMenu toggle"
     #"$mainMod SHIFT, E, exec, test $(hyprland-dialog --title \"Exit Hyprland?\" --text \"That will end your session.\" --buttons Yes --buttons No) = Yes && hyprctl dispatch exit"
      "$mainMod, E, exec, $fileManager"
      "$mainMod SHIFT, W, togglefloating,"
      "$mainMod, D, exec, $menu"
      "$mainMod, V, exec, noctalia-shell ipc call launcher clipboard"
      "$mainMod, P, pseudo,"
      "$mainMod, J, togglesplit,"
      "$mainMod, F, fullscreen,"
      "$mainMod, L, exec, noctalia-shell ipc call lockScreen lock"
      "$mainMod, comma, exec, noctalia-shell ipc call launcher emoji"
      "$mainMod, I, exec, noctalia-shell ipc call settings toggle"
      
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      ", Print, exec, hyprshot -m region --clipboard-only"
    ] ++ (
      # workspaces
      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
      builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mainMod, code:1${toString i}, workspace, ${toString ws}"
            "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9)
    );

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    bindel = [ # volume and brightness buttons
      ",XF86AudioRaiseVolume, exec, noctalia-shell ipc call volume increase"
      ",XF86AudioLowerVolume, exec, noctalia-shell ipc call volume decrease"
      ",XF86AudioMute, exec, noctalia-shell ipc call volume muteOutput"
      ",XF86AudioMicMute, exec, noctalia-shell ipc call volume muteInput"
      ",XF86MonBrightnessUp, exec, noctalia-shell ipc call brightness increase"
      ",XF86MonBrightnessDown, exec, noctalia-shell ipc call brightness decrease"
    ];
    bindl = [
      ", XF86AudioNext, exec, noctalia-shell ipc call media next"
      ", XF86AudioPause, exec, noctalia-shell ipc call media playPause"
      ", XF86AudioPlay, exec, noctalia-shell ipc call media playPause"
      ", XF86AudioPrev, exec, noctalia-shell ipc call media previous"
    ];
  };
}
