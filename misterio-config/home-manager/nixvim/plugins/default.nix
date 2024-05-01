{ pkgs, ... } : {
  programs.nixvim.plugins = {
    # lazy.enable = true;

    lualine = {
      enable = true; 
      sectionSeparators = {
        left = "";
        right = "";
      };
      componentSeparators = {
        left = "|";
        right = "|";
      };
    };

    treesitter.enable = true;

    comment = {
      enable = true;
    };

    surround.enable = true; 

    # harpoon = {
    #   enable = true;
    #   package = pkgs.vimPlugins.harpoon2;
    #   keymaps = {
    #     addFile = "<leader>a";
    #     toggleQuickMenu = "<C-,>";
    #     navFile = {
    #       "1" = "<C-m>";
    #       "2" = "<C-n>";
    #       "3" = "<C-e>";
    #       "4" = "<C-i>";
    # };
    #   };
    # };

    telescope = {
      enable = true; 
      keymaps = {
        "<leader>pf" = "find_files";
        "<leader>pg" = "live_grep";
        "<leader>ph" = "help_tags";
      };
      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
      };
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
    
    lspkind = {
      enable = true;
      mode = "text";
      cmp = {
        enable = true;
        menu = {
          buffer = "[buffer]";
          nvim_lsp = "[LSP]";
          luasnip = "[Luanip}";
          nvim_lua = "[Lua}";
        };
      };
    };
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
       {name = "nvim_lsp";}
       {name = "path";}
       {name = "buffer";}
       {name = "luasnip";}
       {name = "lua";}
      ];
    };
    # nvim-cmp = {
    #   enable = true;
    #   autoEnableSources = true;
    #   sources = [
    #    {name = "nvim_lsp";}
    #    {name = "path";}
    #    {name = "buffer";}
    #    {name = "luasnip";}
    #    {name = "lua";}
    #   ];
    # };
  };
}
