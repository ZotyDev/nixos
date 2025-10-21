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
in
{
  programs.vscode = {
    enable = true;
    profiles = {
      default = vscodeDefaults.defaultProfile;
      "rust" = rustProfile;
      "ruby" = rubyProfile;
    };
  };
}