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
          renice = -10;
          ioprio = 0;
          inhibit_screensaver = 1;
        };
        cpu = mkIf (cfg.cpuGovernor != null) {
          park_cores = "no"; # don't turn off cores
          pin_cores = "yes"; # fix games on specific cores
          gov_governor = "${cfg.cpuGovernor}";
        };
        gpu = {
          # apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          amd_performance_level = "auto";
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
      "vm.swappiness" = 60;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;
    };

    # Process limits for games
    security.pam.loginLimits = [
      # Memory locking - allows anti-cheats and emulators to lock memory
      { domain = "@gaming"; item = "memlock"; type = "hard"; value = "unlimited"; }
      { domain = "@gaming"; item = "memlock"; type = "soft"; value = "unlimited"; }
      
      # File descriptors - supports games with many assets
      { domain = "@gaming"; item = "nofile"; type = "hard"; value = "524288"; }
      { domain = "@gaming"; item = "nofile"; type = "soft"; value = "524288"; }
      
      # Nice priority - allows increasing process priority
      { domain = "@gaming"; item = "nice"; type = "hard"; value = "-10"; }
      { domain = "@gaming"; item = "nice"; type = "soft"; value = "-10"; }
      
      # Real-time priority - for low-latency audio/gaming
      { domain = "@gaming"; item = "rtprio"; type = "hard"; value = "99"; }
      { domain = "@gaming"; item = "rtprio"; type = "soft"; value = "99"; }
    ];

    # Enable realtime scheduling for games
    security.rtkit.enable = true;
  };
}
