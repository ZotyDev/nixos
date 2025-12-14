{ 
  lib,
  pkgs, 
  pkgsStable,
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
    kdePackages.kservice
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark
    kdePackages.isoimagewriter
    (pkgsStable.stremio)
    discord
    jetbrains.idea-community-bin
    jdk8
    jdk17
    jdk21
    jdk25
    aseprite
    unrar
    qbittorrent
    blender
    blockbench
    texliveFull
    obsidian
    postman
    davinci-resolve
    ffmpeg-full
  ];
}
