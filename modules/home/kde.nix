{
  pkgs,
  ...
}:
{
  programs.plasma ={
    enable = true;
    workspace = {
      iconTheme = "Pipurus-Dark";
    };
  };
}