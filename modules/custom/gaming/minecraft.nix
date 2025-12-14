{ lib, config, pkgs, username, ... }:
with lib;
let
  gamingCfg = config.cube.gaming;
  cfg = gamingCfg.minecraft;
in
{
  options.cube.gaming.minecraft = {
    launcher = mkOption {
      type = types.enum [ "prism" ];
      default = "prism";
      description = "Which Minecraft launcher to use";
    };

    javaVersions = mkOption {
      type = types.listOf (types.enum [ "8" "17" "21" "25" ]);
      default = [ "8" "17" "21" "25" ];
      description = "Temurin JDK versions to bundle with the launcher";
    };

    enablePakku = mkOption {
      type = types.bool;
      default = false;
      description = "Enables Pakku CLI tool for modpack";
    };
  };

  config = mkIf (gamingCfg.enable && gamingCfg.minecraft.enable) {
    # Home-manager integration
    home-manager.users.${username} = {
      home.packages = with pkgs; 
        # Prism Launcher with bundled JDKs
        (optionals (cfg.launcher == "prism") [
          (prismlauncher.override {
            jdks = 
              (optional (elem "8" cfg.javaVersions) temurin-bin-8)
              ++ (optional (elem "17" cfg.javaVersions) temurin-bin-17)
              ++ (optional (elem "21" cfg.javaVersions) temurin-bin-21)
              ++ (optional (elem "25" cfg.javaVersions) temurin-bin-25);
          })
        ])
        ++ (optionals cfg.enablePakku [ pakku ]);
    };
  };
}
