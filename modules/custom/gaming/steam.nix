{ lib, config, pkgs, ... }:
with lib;
let
  gamingCfg = config.cube.gaming;
  cfg = gamingCfg.steam;
in
{
  # Add `gamescope %command%` to apply resolution fixes 
  # Add `mangohud %command%` to see a performance hud
  # Add `gamemode %command%` to increase performance in general
  options.cube.gaming.steam = {
    enableProtonGE = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Proton-GE for better game compatibility";
    };

    enableGameScope = mkOption {
      type = types.bool;
      default = true;
      description = "Enable GameScope session for Steam";
    };

    enableProtonTricks = mkOption {
      type = types.bool;
      default = false;
      description = "Enable ProtonTricks for Steam";
    };

    extraCompatTools = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Extra compatibility tools for steam";
    };
  };

  config = mkIf (gamingCfg.enable && gamingCfg.steam.enable) {
    programs.steam = {
      enable = true;

      remotePlay.openFirewall = false;
      dedicatedServer.openFirewall = false;
      localNetworkGameTransfers.openFirewall = true;

      gamescopeSession.enable = cfg.enableGameScope;

      protontricks.enable = cfg.enableProtonTricks;

      extraCompatPackages = with pkgs;
        (optionals cfg.enableProtonGE [ proton-ge-bin ])
        ++ cfg.extraCompatTools;

      # Extra packages that steam might need
      extraPackages = with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };

    # Fonts for better game text rendering
    fonts.packages = with pkgs; [
      liberation_ttf
      wqy_zenhei
    ];
  };
}
