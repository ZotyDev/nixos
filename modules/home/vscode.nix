{
  inputs,
  lib,
  pkgs,
  ...
}:
let marketplace-extensions =
  with inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
    mrmlnc.vscode-duplicate
    ms-azuretools.vscode-containers
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
          # mikestead.dotenv
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

          "workbench.iconTheme" = "material-icon-theme";

          "terminal.integrated.fontLigatures.enabled" = true;

          "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
          "nix.enableLanguageServer" = true;
          "nix.formatterPath" = "nixfmt";
          "nix.serverPath" = (lib.getExe pkgs.nixd);
          "nix.serverSettings"."nixd"."formatting"."commands" = [ "nixfmt" ];
          "nix.serverSettings"."nixd"."formatting"."options" = {
            "enable" = [ true ];
          };

          "git.autofetch" = true;
          "git.enableCommitSigning" = true;

          "chat.disableAIFeatures" = false;
          "chat.mcp.access" = "none";
        };
      };
    };
  };
}
