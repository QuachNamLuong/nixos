{ ... }: 

{
  programs.nixvim = {
    plugins.lsp.server.templ = {
      enable = true;
    };

    filetype.extension.tmpl = "templ";
  };
}
