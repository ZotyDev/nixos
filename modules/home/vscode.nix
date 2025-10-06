{
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          aaron-bond.better-comments
          alefragnani.bookmarks
          # ms-azuretools.vscode-containers
          # mikestead.dotenv
          # mrmlnc.vscode-duplicate
          editorconfig.editorconfig
          # usernamehw.errorlens
          # tamasfe.even-better-toml
          # yzhang.markdown-all-in-one
          pkief.material-icon-theme
          # ms-vscode-remote.remote-ssh
          # ms-vscode-remote.remote-ssh-edit
          # ms-vscode.remote-server
          # ms-vscode.remote-explore
	      ];
      };
    };
  };
}
