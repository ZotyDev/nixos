{
  self,
  lib,
  inputs,
  pkgs,
  ...
}:
let 
  rawDefaultUserSettings = {
    "editor.formatOnSave" = false;
    "editor.minimap.enabled" = true;
    "editor.minimap.renderCharacters" = false;
    "editor.renderControlCharacters" = true;
    "editor.semanticHighlighting.enabled" = true;
    "editor.fontLigatures" = true;
    "editor.tabCompletion" = "on";
    "editor.wordWrap" = "on";
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.rulers" =  "[ 80, 120 ]";

    "explorer.compactFolders" = false;

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

  defaultUserSettings = lib.mapAttrs (name: value: lib.mkDefault value) rawDefaultUserSettings;
in 
{
  defaultExtensions = with pkgs.vscode-extensions; [
    alefragnani.bookmarks
    editorconfig.editorconfig
    aaron-bond.better-comments
    pkief.material-icon-theme
    usernamehw.errorlens
    yzhang.markdown-all-in-one
    mkhl.direnv
  ];
  defaultMarketplaceExtensions = with inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
    mrmlnc.vscode-duplicate
    jnoortheen.nix-ide
    ms-azuretools.vscode-containers
    johnpapa.vscode-peacock
  ];
  defaultProfile = {
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = self.defaultExtensions ++ self.defaultMarketplaceExtensions;
    userSettings = defaultUserSettings;
  };
}