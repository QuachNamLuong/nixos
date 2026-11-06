{ ... }:

{
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        
      ];

      mapping = {
        "<C-Space>" = { __raw = "cmp.mapping.complete()"; };
        "<Tab>" = { __raw = ''
          cmp.mapping(function(fallback))
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
            else
              fallback()
            end
          end, { "i", "s" })
        ''; 
        };
        
        "<S-Tab>" = { __raw = ''
          cmp.mapping(function(fallback))
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
          end, { "i", "s" }) 
        ''; 
        };
        
        "<CR>" = { __raw = "cmp.mapping.confirm({  select = true })"; 
        };
      };
    };
  };
}
