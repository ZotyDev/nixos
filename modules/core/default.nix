{ 
  inputs,
  ...
}: {
  imports = [
    ../custom

    ./boot.nix
    ./zramswap.nix
    ./system.nix
    ./user.nix
    ./security.nix
    ./network.nix
    ./xserver.nix
    ./zsh.nix
    ./services.nix
    ./packages.nix
    ./virtualisation.nix
    ./direnv.nix
    ./stylix.nix

    inputs.stylix.nixosModules.stylix
  ];
}
