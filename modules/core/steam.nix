{
  pkgs,
  ...
}:
{
  # Add `gamescope %command%` to apply resolution fixes 
  # Add `mangohude %command%` to see a performance hud
  # Add `gamemode %command%` to increase performance in general
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.defaultPackages = with pkgs; [
    mangohud
  ];

  programs.gamemode.enable = true;
}