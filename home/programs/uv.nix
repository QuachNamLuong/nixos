{ pkgs, ... }: {
  home.packages = with pkgs; [
    uv
  ];

  # programs.nix-ld.enable = true;
}