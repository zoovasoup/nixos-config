{ pkgs, ... } : {
  programs.neovim = 
    let 
    toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;

    plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-lspconfig;
    }
    {
      plugin = telescope-nvim;
    }
    {
      plugin = comment-nvim;
    }
    {
      plugin = nvim-treesitter.withAllGrammar;
    }


    ];

    extraPackages = with pkgs; [
      tsserver
      lua-language-server
      rnix-lsp
      eslint_d
      pylint
      stylua
    ];

    extraLuaConfig = ''
      ${builtins.readFile} 
    '';
  };
}
