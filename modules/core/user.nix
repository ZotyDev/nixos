{
  pkgs,
  inputs,
  username,
  profile,
  host,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) 
    gitUsername
  ;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    sharedModules = [
      inputs.plasma-manager.homeModules.plasma-manager
    ];
    backupFileExtension = "backup";
    extraSpecialArgs = { 
      inherit 
        inputs 
        username 
        host 
        profile
      ; 
    };
    users.${username} = {
      imports = [ ./../home ];
      home = {
        username = "${username}";
	      homeDirectory = "/home/${username}";

	      # !!!! DO NOT CHANGE !!!!
	      stateVersion = "25.05";
      };
    };
  };

  users.defaultUserShell = pkgs.zsh;
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "${gitUsername}";
    extraGroups = [
      "wheel" # sudo access
      "networkmanager"
      "docker" # access to docker as non-root
    ];
  };
  nix.settings = {
    allowed-users = [ 
      "${username}" 
      ];
    trusted-users = [ 
      "root" 
      "${username}" 
      "@wheel" 
    ];
  };
}
