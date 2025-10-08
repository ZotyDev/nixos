{
  pkgs,
  ...
}:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.defaultPackages = with pkgs; [
    mangohud
  ];

  programs.gamemode.enable = true;
}