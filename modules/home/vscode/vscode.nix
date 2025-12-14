{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  vscodeDefaults = builtins.import ./profiles/default-profile.nix {
    inherit inputs lib pkgs;
    self = vscodeDefaults;
  };
  rustProfile = builtins.import ./profiles/rust-profile.nix {
    inherit inputs lib pkgs;
    baseProfile = vscodeDefaults.defaultProfile;
  };
  rubyProfile = builtins.import ./profiles/ruby-profile.nix {
    inherit inputs lib pkgs;
    baseProfile = vscodeDefaults.defaultProfile;
  };
  latexProfile = builtins.import ./profiles/latex-profile.nix {
    inherit inputs lib pkgs;
    baseProfile = vscodeDefaults.defaultProfile;
  };
  vueProfile = builtins.import ./profiles/vue-profile.nix {
    inherit inputs lib pkgs;
    baseProfile = vscodeDefaults.defaultProfile;
  };
  minecraftModernProfile = builtins.import ./profiles/minecraft-modern.nix {
    inherit inputs lib pkgs;
    baseProfile = vscodeDefaults.defaultProfile;
  };
  flutterProfile = builtins.import ./profiles/flutter-profile.nix {
    inherit inputs lib pkgs;
    baseProfile = vscodeDefaults.defaultProfile;
  };
  astroProfile = builtins.import ./profiles/astro-profile.nix {
    inherit inputs lib pkgs;
    baseProfile = vscodeDefaults.defaultProfile;
  };
in
{
  programs.vscode = {
    enable = true;
    profiles = {
      default = vscodeDefaults.defaultProfile;
      "rust" = rustProfile;
      "ruby" = rubyProfile;
      "latex" = latexProfile;
      "vue" = vueProfile;
      "minecraft-modern" = minecraftModernProfile;
      "flutter" = flutterProfile;
      "astro" = astroProfile;
    };
  };
}