{ 
  lib,
  pkgs, 
  ... 
}: 
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    firefox.enable = true;
    hyprland = {
      enable = true;
      withUWSM = false;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ncdu # Disk Usage Analyzer With Ncurses Interface
    btop
    devenv
    waypaper # Change Wallpaper
    pavucontrol
    docker-compose
    bitwarden-desktop
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.dolphin
    kdePackages.ark
    stremio
    discord
    jetbrains.idea-community-bin
    jdk24
    aseprite
    unrar
  ];
}
