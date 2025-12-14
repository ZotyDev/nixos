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
      enable = true;
      enableExtensionPack = true;
    };
  };

  programs = {
    virt-manager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-viewer # view virtual machines
    lazydocker
    docker-client
  ];
}