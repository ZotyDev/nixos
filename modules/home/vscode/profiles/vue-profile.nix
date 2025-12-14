{
  inputs,
  lib,
  pkgs,
  baseProfile,
  ...
}:
let
  vueExtensions = with pkgs.vscode-extensions; [
    vue.volar
    bradlc.vscode-tailwindcss
  ];
  vueMarketplaceExtensions = with inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    syler.sass-indented
    sibiraj-s.vscode-scss-formatter
  ];
in 
lib.mkMerge [
  baseProfile
  {
    extensions = baseProfile.extensions ++ vueExtensions ++ vueMarketplaceExtensions;
  }
]