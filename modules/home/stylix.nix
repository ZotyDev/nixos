{
  stylix.targets = {
    waybar.enable = false;
    rofi.enable = false;
    hyprland.enable = false;
    hyprlock.enable = false;
    ghostty.enable = false;
    qt = {
      enable = true;
      platform = "qtct";
    };
    vscode = {
      enable = true;
      profileNames = [
        "default"
        "rust"
        "ruby"
      ];
    };
  };
}
