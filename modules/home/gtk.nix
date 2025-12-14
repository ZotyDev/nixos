{
  pkgs,
  ...
}:
{
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
