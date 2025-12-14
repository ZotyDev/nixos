{
  pkgs,
  ...
}:
{
  home.packages = [
    (import ./kbdsetter.nix {
      inherit pkgs;
    })
    (import ./wallsetter.nix {
      inherit pkgs;
    })
    (import ./screenshot.nix {
      inherit pkgs;
    })
    (import ./record.nix {
      inherit pkgs;
    })
  ];
}
