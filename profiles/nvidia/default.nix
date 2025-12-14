{ host, ... }:
{
  imports = [
    ../../hosts/${host}
    ../../modules/drivers
    ../../modules/core
  ];
  drivers.nvidia.enable = true;

  cube.gaming = {
    enable = true;

    steam = {
      enable = true;
      enableProtonGE = true;
      enableGameScope = true;
    };

    minecraft = {
      enable = true;
      launcher = "prism";
      enablePakku = true;
    };

    performance = {
      enable = true;
      enableGameMode = true;
      enableMangoHud = true;
      enableMemoryOptimizations = true;
      cpuGovernor = "performance";
    };

    osu.enable = true;
  };
}
