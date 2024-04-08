{ ... } : {
  programs.nixvim.plugins = {
    lualine.enable = true; 
    treesitter.enable = true;
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true; 
        tsserver.enable = true;
        lua-ls.enable = true; 
      };
    };
  };
}
