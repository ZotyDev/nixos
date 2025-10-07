{ 
  ... 
}: {
  boot = {
    loader.systemd-boot = {
      enable = true;
      consoleMode = "max";
    };
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
  };
}
