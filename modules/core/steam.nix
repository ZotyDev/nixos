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
    protontricks = {
      enable = true;
      package = pkgs.protontricks;
    };
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ]
    ;
  };

  environment.defaultPackages = with pkgs; [
    mangohud
    heroic
  ];

  programs.gamemode.enable = true;
}