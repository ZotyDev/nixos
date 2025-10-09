{
  host,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) gitUsername gitEmail;
in
{
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
    extraConfig = {
      user = {
        signingKey = "~/.ssh/id_ed25519.pub";
      };
      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };
      advice = {
        addEmptyPathspec = false;
        pushNonFastForward = false;
        statusHints = false;
      };
      init = {
        defaultBranch = "main";
      };
      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };
      diff = {
        context = 3;
        rename = "copies";
        interHunkContext = 10;
      };
      pager = {
        diff = "diff-so-fancy | $PAGER";
        branch = false;
        tag = false;
      };
      diff-so-fancy = {
        markEmptyLines = false;
      };
      interactive = {
        diffFilter = "diff-so-fancy --patch";
        singlekey = true;
      };
      push = {
        autoSetupRemote = true;
        default = "current";
        followTags = true;
      };
      pull = {
        default = "current";
        rebase = true;
      };
      rebase = {
        autoStash = true;
        missingCommitsCheck = "warn";
      };
      log = {
        abbrevCommit = true;
        graphColors = "blue,yellow,cyan,magenta,green,red";
      };
      branch = {
        sort = "-commiterdate";
      };
      tag = {
        sort = "-taggerdate";
      };
      commit = {
        gpgSign = true;
      };
      gpg = {
        format = "ssh";
      };
      url = { 
        "git@github.com:ZotyDev/".insteadOf = "zoty:";
      };
    };
  };
}
