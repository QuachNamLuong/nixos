{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    android-studio
  ];

  imports = [
    ./git.nix
    ./obs-studio.nix
    ./vscode.nix
    ./noctalia.nix
    ./umbriel.nix
  ];
}