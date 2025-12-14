{
  inputs,
  lib,
  pkgs,
  baseProfile,
  ...
}:
let
  flutterExtensions = with pkgs.vscode-extensions; [
    dart-code.flutter
    dart-code.dart-code
  ];
in 
lib.mkMerge [
  baseProfile
  {
    extensions = baseProfile.extensions ++ flutterExtensions;
  }
]