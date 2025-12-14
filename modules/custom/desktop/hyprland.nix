{ lib, config, pkgs, ... }:
with lib;
let
  desktopCfg = config.cube.desktop;
  enabled = desktopCfg.enable && desktopCfg.compositor == "hyprland";
in
{
  config = mkIf enabled {
    programs.hyprland = {
      enable = true;
      withUWSM = false;
    };
  };
}