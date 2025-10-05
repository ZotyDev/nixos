{ pkgs, ... }: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  environment.systemPackages = with pkgs; [
    ncdu # Disk Usage Analyzer With Ncurses Interface
    btop
  ];
}
