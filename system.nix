{ config, pkgs, hostname, username, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Sao_Paulo";

  console.keyMap = "br-abnt2";
  
  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
  
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  }; 

  system.stateVersion = "25.05";
}
