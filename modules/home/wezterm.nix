{
  pkgs,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = pkgs.wezterm;
    extraConfig = ''
      config.enable_tab_bar = false
    '';
  }; 
}
