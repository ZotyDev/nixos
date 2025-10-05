let
  inherit (import ../default/variables.nix)
    gitUsername
    gitEmail;
in
{
  inherit gitUsername;
  inherit gitEmail;

  keyboardLayout = "br"; 
  consoleKeyMap = "br-abnt2";
  i18nLocale = "en_US.UTF-8";
}
