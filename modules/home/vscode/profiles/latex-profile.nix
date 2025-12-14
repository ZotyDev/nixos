{
  inputs,
  lib,
  pkgs,
  baseProfile,
  ...
}:
let
  latexExtensions = with pkgs.vscode-extensions; [
    james-yu.latex-workshop
  ];
in 
lib.mkMerge [
  baseProfile
  {
    extensions = baseProfile.extensions ++ latexExtensions;
  }
]