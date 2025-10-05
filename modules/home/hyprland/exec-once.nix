{
  host,
  ...
}:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    stylixImage
  ;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "wl-paste --type text --watch cliphist store" # Saves text
      "wl-paste --type image --watch cliphist store" # Saves images

      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"

      "killall -q swww;sleep .5 && swww-daemon"
      "#wallsetter &"
      "sleep 1.0 && swww img ${stylixImage}"
    ]; 
  };
}
