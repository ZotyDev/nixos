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

  keyboardLayout = "us"; 
  keyboardVariant = "";
  secondaryKeyboardLayout = "br";
  secondaryKeyboardVariant = "abnt2";
  consoleKeyMap = "us";
  i18nLocale = "en_US.UTF-8";

  stylixImage = ../../wallpapers/cartoon-wizard.jpg;
}
