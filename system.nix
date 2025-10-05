{ config, pkgs, hostname, username, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  console.keyMap = "br-abnt2";

  environment.systemPackages = with pkgs; [
    git
    neovim
  ]; 
}
