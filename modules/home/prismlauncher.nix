{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        temurin-bin-8
        temurin-bin-17
        temurin-bin-21
        temurin-bin-25
      ];
    })
  ];
}