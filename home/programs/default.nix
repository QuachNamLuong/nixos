{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    android-studio
    chromium
    alacritty
  ];

  imports = [
    ./git.nix
    ./obs-studio.nix
    ./vscode.nix
    ./noctalia.nix
    ./umbriel.nix
  ];
}