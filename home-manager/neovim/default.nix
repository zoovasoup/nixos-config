{ pkgs , ... } : {

  programs.neovim = 
    let 
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in 
    {
    enable = true;

    plugins = with pkgs.vimPlugins; [
    {
    plugin = nvim-lspconfig;
    config = toLuaFile ./lua/plugins/lsp/lspconfig.lua;
    }
    mason-nvim
    formatter-nvim
    {
    plugin = telescope-nvim;
    config = toLuaFile ./lua/plugins/telescope.lua;
    }
    telescope-fzf-native-nvim
    {plugin = comment-nvim;}
    {plugin = nvim-treesitter.withAllGrammars;}
    gitsigns-nvim
    lualine-nvim
    colorizer
    surround
    ChatGPT-nvim
    harpoon2
    plenary-nvim
    fugitive
    orgmode
    oil-nvim
    lspkind-nvim
    {
    plugin = nvim-cmp;
    }
    cmp-nvim-lsp
    cmp-nvim-tags
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp_luasnip
    nvim-lint
    conform-nvim
    ];

    extraPackages = with pkgs; [
      nixd
      nil
      alejandra
      nodePackages_latest.typescript-language-server
      lua-language-server
      eslint_d
      pylint
      stylua
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./lua/core/keymaps.lua} 
      ${builtins.readFile ./lua/core/options.lua} 
      ${builtins.readFile ./lua/core/colemak-dh.lua} 
    '';
  };
}
