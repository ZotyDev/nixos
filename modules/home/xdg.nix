{
  pkgs,
  ...
}:
{
  home.file.".config/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "firefox.desktop" ];
        "application/zip" = [ "org.kde.ark.desktop" ];
        "application/x-tar" = [ "org.kde.ark.desktop" ];
        "application/gzip" = [ "org.kde.ark.desktop" ];
        "application/x-bzip2" = [ "org.kde.ark.desktop" ];
        "application/x-xz" = [ "org.kde.ark.desktop" ];
        "application/x-rar-compressed" = [ "org.kde.ark.desktop" ];
        "application/x-7z-compressed" = [ "org.kde.ark.desktop" ];
      };
    };
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      configPackages =  [ pkgs.hyprland ];
    };
  };
}
