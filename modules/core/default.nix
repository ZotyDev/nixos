{ ... }: {
  imports = [
    ./boot.nix
    ./system.nix
    ./user.nix
    ./security.nix
    ./network.nix
    ./xserver.nix
    ./services.nix
    ./packages.nix
  ];
}
