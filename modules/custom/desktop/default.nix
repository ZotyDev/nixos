{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.cube.desktop;
in
{
  options.cube.desktop = {
    enable = mkEnableOption "Desktop environment configuration";

    compositor = mkOption {
      type = types.enum [ "hyprland" "none" ];
      default = "none";
      description = "Wich Wayland compositor to use";
    };

    enableFonts = mkOption {
      type = types.bool;
      default = true;
      description = "Install common desktop fonts";
    };

    enableTheming = mkOption {
      type = types.bool;
      default = true;
      description = "Enable desktop theming (GTK, Qt, icons)";
    };

    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Additional desktop packages to install";
    };
  };

  imports = [
    ./hyprland.nix
    ./common.nix
  ];

  config = mkIf cfg.enable {
    xdg.portal = mkIf (cfg.compositor != "none") {
      enable = true;
      extraPortals = with pkgs;
        if cfg.compositor == "hyprland" then [
          xdg-desktop-portal-hyprland
          xdg-desktop-portal-gtk
        ]
        else [];
    
      config.common.default = "*";
    };
  };
}