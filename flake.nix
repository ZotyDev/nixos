{
  description = "A very basic flake";

  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-25.05";
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
      hostname = "nixos";  
      username = "zoty";
      host = "asus-laptop";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
	specialArgs = {
          inherit inputs;
	  inherit username;
	  inherit hostname;
	  inherit host;
	};
	modules = [
	  ./modules/core
          ./system.nix 
	];
      };
    };
}
