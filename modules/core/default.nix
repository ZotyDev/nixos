{ 
  inputs,
  ...
}: {
  imports = [
    ./boot.nix
    ./system.nix
    ./user.nix
    ./security.nix
    ./network.nix
    ./xserver.nix
    ./services.nix
    ./packages.nix
    ./stylix.nix

    inputs.stylix.nixosModules.stylix
  ];
}
