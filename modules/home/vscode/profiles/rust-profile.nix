{
  inputs,
  lib,
  pkgs,
  baseProfile,
  ...
}:
let
  rustExtensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
    fill-labs.dependi
    tamasfe.even-better-toml
  ];
  rustMarketplaceExtensions = with inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
    noah-labrecque.wgsl-lang
  ];
in 
lib.mkMerge [
  baseProfile
  {
    extensions = baseProfile.extensions ++ rustExtensions ++ rustMarketplaceExtensions;

    userSettings = {
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "rust-lang.rust-analyzer";

      # "rust-analyzer.server.path" = "rust-analyzer";
      "rust-analyzer.checkOnSave" = true;
      "rust-analyzer.cargo.runBuildScripts" = true;
      "rust-analyzer.check.command" = "clippy";

      "[toml]"."editor.defaultFormatter" = "tamasfe.even-better-toml";

      "debug.allowBreakpointsEverywhere" = false;
    };
  }
]