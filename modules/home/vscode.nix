{
  inputs,
  pkgs,
  ...
}:
let marketplace-extensions =
  with inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
    jnoortheen.nix-ide
  ];
in
{
  nixpkgs.config.allowUnfree = true; 

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        enableExtensionUpdateCheck = false;
	      enableUpdateCheck = false;
        extensions = with pkgs.vscode-extensions; 
	        marketplace-extensions
          ++ [
            alefragnani.bookmarks
            editorconfig.editorconfig	    
            aaron-bond.better-comments
            pkief.material-icon-theme
            usernamehw.errorlens
            yzhang.markdown-all-in-one
          ];
          # ms-azuretools.vscode-containers
          # mikestead.dotenv
          # mrmlnc.vscode-duplicate
          # tamasfe.even-better-toml
          # ms-vscode-remote.remote-ssh
          # ms-vscode-remote.remote-ssh-edit
          # ms-vscode.remote-server
          # ms-vscode.remote-explore
        userSettings = {
          "editor.formatOnSave" = false;
          "editor.minimap.enabled" = true;
          "editor.minimap.renderCharacters" = false;
          "editor.renderControlCharacters" = true;
          "editor.semanticHighlighting.enabled" = true;
          "editor.fontLigatures" = true;
          "editor.tabCompletion" = "on";
          "editor.wordWrap" = "on";
          "editor.cursorSmoothCaretAnimation" = "on";
          "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
          "workbench.iconTheme" = "material-icon-theme";
          "terminal.integrated.fontLigatures.enabled" = true;

          "chat.disableAIFeatures" = false;
          "chat.mcp.access" = "none";
        };
      };
    };
  };
}
