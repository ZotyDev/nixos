{ ... }: {
  imports = [
    ./boot.nix
    ./system.nix
    ./user.nix
    ./network.nix
    ./xserver.nix
    ./services.nix
    ./packages.nix
  ];
}
