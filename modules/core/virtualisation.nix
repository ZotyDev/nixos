{
  pkgs,
  ...
}:
{
  virtualisation = {
    docker = {
      enable = true;
    };

    libvirtd = {
      enable = true;
    };

    virtualbox.host = {
      enable = false;
      enableExtensionPack = true;
    };
  };

  programs = {
    virt-manager.enable = false;
  };

  environment.systemPackages = with pkgs; [
    virt-viewer # view virtual machines
    lazydocker
    docker-client
  ];
}