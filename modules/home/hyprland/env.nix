{
  host,
  ...
}:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    defaultTerminal
  ;
in
{
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        "XDG_CURRENT_DESKTOP, Hyprland"
				"XDG_SESSION_TYPE, wayland"
				"XDG_SESSION_DESKTOP, Hyprland"
				"XDG_MENU_PREFIX, kbuildsycoca6"
				"GDK_BACKEND, wayland, x11"
				"CLUTTER_BACKEND, wayland"
				"QT_QPA_PLATFORM=wayland;xcb"
				"QT_QPA_PLATFORMTHEME=qt6ct"
				"QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
				"QT_AUTO_SCREEN_SCALE_FACTOR, 1"
				"SDL_VIDEO_DRIVER, x11"
				"MOZ_ENABLE_WAYLAND, 1"
				# This is to make electron apps start in wayland
				"ELECTRON_OZONE_PLATFORM_HINT, wayland"
				"GDK_SCALE, 1"
				"QT_SCALE_FACTOR, 1"
				"EDITOR, nvim"
				"TERMINAL, ${defaultTerminal}"
				"XDG_TERMINAL_EMULATOR, ${defaultTerminal}"
      ];
    };
  };
}
