{
  pkgs,
  username,
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
  ];
}
