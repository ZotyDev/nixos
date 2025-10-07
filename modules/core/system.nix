{ 
  host, 
  ... 
}:
let
  inherit (import ../../hosts/${host}/variables.nix) consoleKeyMap i18nLocale;
in
{
  nix = {
    settings = {
      download-buffer-size = 200000000;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
	      "flakes"
      ];
    };
  };
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "${i18nLocale}";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${i18nLocale}";
    LC_IDENTIFICATION = "${i18nLocale}";
    LC_MEASUREMENT = "${i18nLocale}";
    LC_MONETARY = "${i18nLocale}";
    LC_NAME = "${i18nLocale}";
    LC_NUMERIC = "${i18nLocale}";
    LC_PAPER = "${i18nLocale}";
    LC_TELEPHONE = "${i18nLocale}";
    LC_TIME = "${i18nLocale}";
  };
  console.keyMap = "${consoleKeyMap}";

  # !!!! DO NOT CHANGE !!!!
  system.stateVersion = "25.05";
}
