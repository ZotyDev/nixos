{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.cube.gaming;
in
{
  options.cube.gaming = {
    enable = mkEnableOption "Complete gaming setup";

    # Sub-modules
    steam.enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Steam with optimizations";
    };

    minecraft.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Minecraft launchers and tools";
    };

    emulation.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable emulation tools";
    };

    performance.enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable performance tools (GameMode, MangoHud)";
    };

    # Extras
    osu.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable osu!lazer";
    };

    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Additional gaming packages";
    };
  };
  
  imports = [
    ./steam.nix
    ./minecraft.nix
    ./performance.nix
  ];

  config = mkIf cfg.enable {
    # Osu
    environment.systemPackages = with pkgs;
      (optionals cfg.osu.enable [ osu-lazer ])
      ++ cfg.extraPackages;

    # Gaming group for user
    users.groups.gaming = {};
  };
}
