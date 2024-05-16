{ ... } : {
  programs.nixvim.plugins = {

    # lazy = {
    #   enable = true;
    #   plugins = [
    #    {lualine.enabled = true;}
    #   ];
    # };

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

    gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "+";
        change.text = "-";
      };
    };

    nvim-colorizer = {
      enable = true;
      userDefaultOptions.names = false;
    };

    comment = {
      enable = true;
    };

    surround.enable = true; 

    harpoon = {
      enable = true;
      enableTelescope = true;
      keymapsSilent = false;
      keymaps = {
        addFile = "<leader>a";
        toggleQuickMenu = "<C-Return>";
        navFile = {
          "1" = "<C-m>";
          "2" = "<C-n>";
          "3" = "<C-e>";
          "4" = "<C-i>";
        };
      };
    };

    telescope = {
      enable = true; 
      keymaps = {
        "<leader>pf" = "find_files";
        "<leader>pg" = "live_grep";
        "<leader>ph" = "help_tags";
        "<leader>pt" = "git_files";
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

    luasnip = {
      enable = true;
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
    cmp-cmdline = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true; 
        tsserver.enable = true;
        # rnix-lsp.enable = true;
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
          luasnip = "[Luanip]";
          nvim_lua = "[Lua]";
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

    lint = {
      enable = true;
      lintersByFt = {
        javascript = [ "eslint_d" ];
        typescript = [ "eslint_d" ];
        javascriptreact = [ "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
        svelte = [ "eslint_d" ];
        python = [ "pylint" ];
      };
    };

  };
}
