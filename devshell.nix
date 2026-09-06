{ pkgs, ... }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs_22
    pnpm
  ];

  shellHook = ''
    echo "Node $(node -v) dev environment loaded!"
  '';
}
