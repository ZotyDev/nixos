{ ... }: {
  imports = [
    ./boot.nix
    ./system.nix
    ./user.nix
    ./network.nix
    ./services.nix
    ./packages.nix
  ];
}
