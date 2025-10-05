{
  pkgs,
  username,
  ...
}:
{
  home.packages = [
    (import ./wallsetter.nix {
      inherit pkgs;
    })
  ];
}
