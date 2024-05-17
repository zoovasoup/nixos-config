{ pkgs, ... }:

{
  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      #lsp
      nixd
      nil
      alejandra
      typescript
      nodePackages_latest.typescript-language-server
      lua-language-server
      nodePackages_latest.vscode-html-languageserver-bin
      nodePackages_latest.tailwindcss
      nodePackages_latest.vscode-css-languageserver-bin
      nodePackages_latest.graphql-language-service-cli
      emmet-ls
      pyright

      #formatter/linter
      nodePackages_latest.prettier
      eslint_d
      pylint
      stylua
    ];

    plugins = with pkgs.vimPlugins; [

      #lsp
      nvim-lspconfig
      neodev-nvim
      lspkind-nvim

      #completion
      nvim-cmp 
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-tags
      cmp-buffer
      cmp-path
      cmp-cmdline

      #formateer/linter
      formatter-nvim
      nvim-lint

      #snippets
      luasnip
      friendly-snippets

      #project navigation
      telescope-nvim
      telescope-fzf-native-nvim
      harpoon2
      plenary-nvim
      fugitive
      oil-nvim
      conform-nvim

      #visual
      lualine-nvim
      nvim-web-devicons
      nvim-treesitter.withAllGrammars
      vim-nix
      gitsigns-nvim
      colorizer
      surround
      ChatGPT-nvim
      nvim-ufo
      promise-async

      {
        plugin = comment-nvim;
        # config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }
    ];


    extraLuaConfig = ''
      ${builtins.readFile ./zoova/core/keymaps.lua} 
      ${builtins.readFile ./zoova/core/options.lua} 
      ${builtins.readFile ./zoova/core/colemak-dh.lua} 
      ${builtins.readFile ./zoova/plugins/lsp.lua}
      ${builtins.readFile ./zoova/plugins/cmp.lua}
      ${builtins.readFile ./zoova/plugins/treesitter.lua}
      ${builtins.readFile ./zoova/plugins/telescope.lua}
      ${builtins.readFile ./zoova/plugins/formatter.lua}
      ${builtins.readFile ./zoova/plugins/harpoon.lua}
      ${builtins.readFile ./zoova/plugins/default.lua}
    '';

  };
}
