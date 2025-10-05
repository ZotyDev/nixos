let
  inherit (import ../default/variables.nix)
    gitUsername
    gitEmail
    
    defaultTerminal
    defaultBrowser
    ;
in
{
  inherit gitUsername;
  inherit gitEmail;

  inherit defaultTerminal;
  inherit defaultBrowser;

  keyboardLayout = "br"; 
  keyboardVariant = "abnt2";
  consoleKeyMap = "br-abnt2";
  i18nLocale = "en_US.UTF-8";

  stylixImage = ../../wallpapers/cartoon-wizard.jpg;
}
