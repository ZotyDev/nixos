{ config, pkgs, ... }: {
  users.users.zoty = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "123";
    shell = pkgs.bash;
  };
}
