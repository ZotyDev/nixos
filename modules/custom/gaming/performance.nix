{ lib, config, pkgs, ... }:
with lib;
let
  gamingCfg = config.cube.gaming;
  cfg = gamingCfg.performance;
in
{
  options.cube.gaming.performance = {
    enableGameMode = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Feral GameMode for performance optimizations";
    };

    enableMangoHud = mkOption {
      type = types.bool;
      default = true;
      description = "Enable MangoHud for FPS/performance overlay";
    };

    enableGameScope = mkOption {
      type = types.bool;
      default = true;
      description = "Enable GameScope compositor";
    };

    cpuGovernor = mkOption {
      type = types.enum [ "performance" "powersave" "schedutil" "ondemand" null ];
      default = null;
      description = "CPU governor to use when gaming (null = don't change)";
    };

    enableMemoryOptimizations = mkOption {
      type = types.bool;
      default = true;
      description = "Enable memory optimizations for gaming";
    };
  };

  config = mkIf (gamingCfg.enable && gamingCfg.performance.enable) {
    programs.gamemode = mkIf cfg.enableGameMode {
      enable = true;
      enableRenice = true;
      settings = {
        general = {
          renice = 10;
        };
        cpu = mkIf (cfg.cpuGovernor != null) {
          park_cores = "no";
          pin_cores = "yes";
        };
      };
    };

    # Packages
    environment.systemPackages = with pkgs;
      (optionals cfg.enableMangoHud [ mangohud ])
      ++ (optionals cfg.enableGameScope [ gamescope ]);

    # Memory optimizations
    boot.kernel.sysctl = mkIf cfg.enableMemoryOptimizations {
      # Better memory management for gaming
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;
    };

    # Process limits for games
    security.pam.loginLimits = [
      { domain = "*"; item = "memlock"; type = "hard"; value = "unlimited"; }
      { domain = "*"; item = "memlock"; type = "soft"; value = "unlimited"; }
      { domain = "*"; item = "nofile"; type = "hard"; value = "unlimited"; }
    ];

    # Enable realtime scheduling for games
    security.rtkit.enable = true;
  };
}
