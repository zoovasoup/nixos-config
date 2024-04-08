{ ... } : {
  programs.nixvim.plugins = {
    lazy.enable = true;

    lualine.enable = true; 
    treesitter.enable = true;
    comment.enable = true;
    surround.enable = true; 
    harpoon.enable = true; 

    telescope = {
      enable = true; 
      extension.fzy-native.enable = true;
    };

    undotree.enable = true;
    fugitive.enable = true;
    oil.enable = true;

    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true; 
        tsserver.enable = true;
        lua-ls.enable = true; 
      };
    };
    
    cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
       {name = "nvim_lsp";}
       {name = "path";}
       {name = "buffer";}
       {name = "luasnip";}
       {name = "lua";}
      ];
    };
  };
}
