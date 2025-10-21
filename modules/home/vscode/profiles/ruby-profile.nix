{
  inputs,
  lib,
  pkgs,
  baseProfile,
  ...
}:
let 
  rubyExtensions = with pkgs.vscode-extensions; [
    castwide.solargraph
  ];
in
lib.mkMerge [
  baseProfile
  {
    extensions = baseProfile.extensions ++ rubyExtensions;
  }
]