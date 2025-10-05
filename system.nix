{ config, pkgs, hostname, username, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
  ]; 
}
