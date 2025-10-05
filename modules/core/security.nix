{
  security = {
    rtkit.enable = true;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
    };
    polkit = {
      enable = true;
    };
  };
}
