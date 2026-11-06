{ ... }: 

{
  programs.nixvim = {
    plugins.lsp.servers.templ = {
      enable = true;
    };

    filetype.extension.tmpl = "templ";
  };
}
