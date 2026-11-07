{ ... }: 

{
  imports = [
    ./nixd.nix
    ./gopls.nix
    ./templ.nix
    ./ts_ls.nix
  ];

  programs.nixvim.plugins.lsp.enable = true;
}
