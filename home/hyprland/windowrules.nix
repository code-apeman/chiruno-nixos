{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Ignore maximize requests from apps. You'll probably like this.
      "suppress_event maximize, match:class .*"
   
      # Fix some dragging issues with XWayland
      "no_focus true,match:class ^$,match:title ^$,match:xwayland true,match:float true,match:fullscreen false,match:pin false"
   
      # Make pavucontrol(-qt) always floating
      "float true,match:class ^(org.pulseaudio.)*(pavucontrol)(qt)*$"
   
      # Make xdg-desktop-portal always floating
      "float true,match:class ^(xdg-desktop-portal).*$"
   
      # Make kmix always floating
      "float true,match:class ^(org.kde.kmix)*$"
   
      # Fix jitter in games
      "immediate true,match:class ^(steam_app_).*$"
      "immediate true,match:class ^(Minecraft).*$"
   
      "fullscreen true,match:class ^(gamescope)$"
      "immediate true,match:class ^(gamescope)$"
   
   
      # adding more here as needed.
      "min_size 250 250,match:class ^(Unity)$,match:title ^(Project Settings)$"
      "min_size 250 250,match:class ^(Unity)$,match:title ^(Preferences)$"
      "min_size 250 250,match:class ^(Unity)$,match:title ^(UnityEditor.AddComponent.AddComponentWindow)$"
      "min_size 250 250,match:class ^(Unity)$,match:title ^(Package Manager)$"
      "min_size 250 250,match:class ^(Unity)$,match:title ^(UI Toolkit Debugger)$"
      "min_size 250 500,match:class ^(Unity)$,match:title ^(Font Asset Creator)$"
      "min_size 500 250,match:class ^(Unity)$,match:title ^(Background Tasks)$"
   
   
      "min_size 150 300,match:initial_title (UnityEditor.PopupWindow)"
      "min_size 230 200,match:initial_title (UnityEditor.AddComponent.AddComponentWindow)"
      "min_size 500 500,match:initial_title (UnityEngine.InputSystem.Editor.AdvancedDropdownWindow)"
      "min_size 230 500,match:initial_title (UnityEditor.AnnotationWindow)"
      "min_size 300 200,match:initial_title (UnityEditor.IMGUI.Controls.AdvancedDropdownWindow)"
      "move cursor,match:class ^(Unity)$,match:title ^(UnityEditor.AddComponent.AddComponentWindow)$"
      "move cursor,match:class ^(Unity)$,match:title ^(UnityEditor.IMGUI.Controls.AdvancedDropdownWindow)$"
      "move cursor,match:class ^(Unity)$,match:title ^(UnityEngine.InputSystem.Editor.AdvancedDropdownWindow)$"
      "move cursor,match:class ^(Unity)$,match:title ^(UnityEditor.PopupWindow)$"
      "move cursor,match:class ^(Unity)$,match:title ^(Preferences)$"
   
      # windowrulev2 = move cursor,match:class ^(Unity)$
   
      # Color Picker for unity
      "move cursor,match:class ^(Unity)$,match:title ^(Color)$"
      "move cursor,match:class ^(Unity)$,match:title ^(HDR Color)$"
    ];
  };
}
