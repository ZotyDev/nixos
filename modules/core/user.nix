{
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

  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "${gitUsername}";
    extraGroups = [
      "wheel" # sudo access
      "networkmanager"
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
