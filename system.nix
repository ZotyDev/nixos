{ config, pkgs, hostname, username, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  console.keyMap = "br-abnt2";
  
  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
  ]; 
}
