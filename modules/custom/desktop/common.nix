{ lib, config, pkgs, ... }:
with lib;
let
  desktopCfg = config.cube.desktop;
  enabled = desktopCfg.compositor != "none";
in
{
  environment.systemPackages = with pkgs; mkIf enabled [
    wl-clipboard
    wlr-randr
    grim
    slurp
    libnotify
  ];

  environment.sessionVariables = mkIf enabled {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}