{
  description = "HydraOS";

  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-25.05";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = 
    { 
      self,
      nixpkgs, 
      home-manager,
      ...
    }@inputs:
    let 
      system = "x86_64-linux";
      host = "asus-laptop";
      username = "zoty";
      profile = "intel";

      # Deduplicate nixosConfigurtaions while preserving the top-level 'profile'
      mkNixosConfig = gpuProfile: nixpkgs.lib.nixosSystem {
        inherit system;
	specialArgs = {
          inherit inputs;
	  inherit host;
	  inherit username;
	  inherit profile; # keep using the let-bound profile for modules/scripts
	};
	modules =[
	  ./profiles/${gpuProfile}
	];
      };
    in
    {
      nixosConfigurations = {
        amd = mkNixosConfig "amd";
	nvidia = mkNixosConfig "nvidia";
	nvidia-laptop = mkNixosConfig "nvidia-laptop";
	amd-hybrid = mkNixosConfig "amd-hybrid";
	intel = mkNixosConfig "intel";
	vm = mkNixosConfig "vm";
      };
  };
}
