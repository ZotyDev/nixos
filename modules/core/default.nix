{ 
  inputs,
  ...
}: {
  imports = [
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
    ./steam.nix

    inputs.stylix.nixosModules.stylix
  ];
}
