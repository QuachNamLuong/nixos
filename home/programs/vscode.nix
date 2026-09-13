{ pkgs, ... }:
let
  commonSettings = {
    "files.autoSave" = "afterDelay";
    "files.autoSaveDelay" = 1000;
    "explorer.confirmPasteNative" = false;
    "explorer.confirmDelete" = false;
    "git.enableSmartCommit"= true;
  };
in {
  programs.vscodium = {
    enable = true;

    profiles = {
      default = {
        userSettings = commonSettings // {
          
        };

        extensions = [
          pkgs.vscode-marketplace.jnoortheen.nix-ide
          pkgs.vscode-marketplace.golang.go
        ];
      };

      nix = {
        userSettings = commonSettings // {
          # Profile-specific overrides can go here
        };
        extensions = [
          pkgs.vscode-marketplace.jnoortheen.nix-ide
        ];
      };

      go = {
        userSettings = commonSettings // {

        };
        extensions = [
          pkgs.vscode-marketplace.golang.go
        ];
      };
    };
  };
}