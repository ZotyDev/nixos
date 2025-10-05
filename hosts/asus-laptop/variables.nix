let
  inherit (import ../default/variables.nix)
    gitUsername
    gitEmail;
in
{
  inherit gitUsername;
  inherit gitEmail;

  keyboardLayout = "br-abnt2"; 
  consoleKeyMap = "br-abnt2";
  i18nLocale = "en_US.UTF-8";
}
