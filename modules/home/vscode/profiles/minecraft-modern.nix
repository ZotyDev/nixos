{
  inputs,
  lib,
  pkgs,
  baseProfile,
  ...
}:
let
  minecraftModernMarketplaceExtensions = with inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
    prunoideae.probejs
  ];
in 
lib.mkMerge [
  baseProfile
  {
    extensions = baseProfile.extensions ++ minecraftModernMarketplaceExtensions;
  }
]