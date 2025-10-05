{ ... }: {
  imports = [
    ./boot.nix
    ./system.nix
    ./services.nix
    ./packages.nix
  ];
}
