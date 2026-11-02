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
  home.packages = [
    pkgs.gopls
  ];

  programs.vscodium = {
    enable = true;

    mutableExtensionsDir = false;

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
          pkgs.vscode-marketplace.jnoortheen.nix-ide
          pkgs.vscode-marketplace.a-h.templ
        ];
      };

      tauri = {
        userSettings = commonSettings // {

        };
        extensions = [
          pkgs.vscode-marketplace.rust-lang.rust-analyzer
          pkgs.vscode-marketplace.jnoortheen.nix-ide
          pkgs.vscode-marketplace.bradlc.vscode-tailwindcss
        ];
      };
    };
  };
}