{
  inputs,
  lib,
  pkgs,
  baseProfile,
  ...
}:
let
  astroExtensions = with pkgs.vscode-extensions; [
    astro-build.astro-vscode
  ];
in 
lib.mkMerge [
  baseProfile
  {
    extensions = baseProfile.extensions ++ astroExtensions;
  }
]