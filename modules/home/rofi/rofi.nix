{
  pkgs,
  config,
  host,
  ...
}:
let 
  inherit (import ../../../hosts/${host}/variables.nix)
    defaultTerminal
  ;
in 
{
  programs = {
    rofi = {
      enable = true;
      extraConfig = {
        # General
        modi = "drun,run,filebrowser,window";
        case-sensitive = false;
        cycle = true;
        filter = "";
        scroll-method = 0;
        normalize-match = true;
        show-icons = true;
        icon-theme = "Papirus-Dark";
        steal-focus = false;

        # Matching
        matching = "normal";
        tokenize = true;

        # SSH
        ssh-client = "ssh";
        ssh-command = "{terminal} -e {ssh-client} {host} [-p {port}]";
        parse-hosts = false;
        parse-known-hosts = true;

        # Drun
        drun-categories = "";
        drun-match-fields = "name,generic,exec,categories,keyboards";
        drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
        drun-show-actions = false;
        drun-url-launcher = "xdg-open";
        drun-use-dekstop-cache = false;
        drun-reload-desktop-cache = false;
        # drun.parse-user = true;
        # drun.parse-system = true;
        
        # Run
        run-command = "{cmd}";
        run-list-command = "";
        run-shell-command = "{terminal} -e {cmd}";

        # Fallback Icon
        # drun.fallback-icon = "application-x-addon";
        # run.fallback-icon = "application-x-addon";

        # History and Sorting
        disable-history = false;
        sorting-method = "normal";
        max-history-size = 25;

        # Diplay
        display-window = "Window";
        display-run = "Run";
        display-ssh = "SSH";
        dispaly-drun = "Apps";
        display-combi = "Combi";
        display-keys = "Keys";
        display-filebrowser = "Files";

        # Misc
        terminal = "${defaultTerminal}";
        # font = "Mono 12";
        sort = false;
        threads = 0;
        click-to-exit = true;

        # Filebrowser
        # filebrowser = {
          # directory = "/home";
        #   directories-first = true;
        #   sorting-method = "name";
        # };

        # Other
        # timeout = {
        #   action = "kb-cancel";
        #   delay = 0;
        # };
      };
    };
  };
}