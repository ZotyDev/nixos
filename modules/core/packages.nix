{ 
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

  environment.systemPackages = with pkgs; [
    ncdu # Disk Usage Analyzer With Ncurses Interface
    btop
    waypaper # Change Wallpaper
  ];
}
