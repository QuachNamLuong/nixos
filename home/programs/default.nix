{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./obs-studio.nix
    ./vscode.nix
    ./noctalia.nix
    ./umbriel.nix
    ./uv.nix
  ];
}