{
  host,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) 
    keyboardLayout
    keyboardVariant
  ;
in
{
  services.xserver = {
    enable = false;
    xkb = {
      layout = "${keyboardLayout}";
      variant = "${keyboardVariant}";
    };
  };
}
