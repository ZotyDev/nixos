{
  pkgs,
  host,
  ...
}:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    firewall = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
