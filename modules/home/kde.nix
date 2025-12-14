{
  lib,
  pkgs,
  desktopCompositor ? "none",
  ...
}:
with lib;
{
  programs.plasma = {
    enable = mkDefault false;
    workspace = {
      iconTheme = "Pipurus-Dark";
    };
  };
}