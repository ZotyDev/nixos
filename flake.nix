{
  description = "HydraOS";

  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    # Nixohess
    nixohess.url = "gitlab:fazzi/nixohess";
    nixohess.inputs.nixpkgs.follows = "nixpkgs-stable";
    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # Stylix (Colors and Themes)
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    # Plasma Manager (KDE)
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
    # VSCode Marketplace
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # SOPS
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = 
  { 
    self,
    nixpkgs, 
    nixpkgs-stable,
    nixohess,
    home-manager,
    plasma-manager,
    sops-nix,
    ...
  }@inputs:
  let 
    system = "x86_64-linux";
    host = "intel-nvidia-desktop";
    username = "zoty";
    profile = "nvidia";

    pkgsStable = import nixpkgs-stable {
      inherit system;
    };

    # Deduplicate nixosConfigurtaions while preserving the top-level 'profile'
    mkNixosConfig = gpuProfile: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        inherit host;
        inherit username;
        inherit profile; # keep using the let-bound profile for modules/scripts
        inherit pkgsStable; # some packages need to be stable
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
      intel = mkNixosConfig "intel";
      vm = mkNixosConfig "vm";
    };
  };
}
