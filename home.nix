{ username }: { config, pkgs, ... }: {
  home.username = username;

  programs.home-manager.enable = true;
  programs.neovim.enable = true;
  
  home.stateVersion = "25.05";
}
