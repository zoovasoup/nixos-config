{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      #treesitter
      tree-sitter
      gcc

      # Nix #lsp
      nixd
      nil
      alejandra

      # TypeScript #lsp
      typescript
      nodePackages_latest.typescript-language-server

      # Lua #lsp
      lua-language-server

      # HTML #lsp
      emmet-ls

      # CSS #lsp
      tailwindcss-language-server

      # GraphQL #lsp
      nodePackages_latest.graphql-language-service-cli

      # Svelte #lsp
      nodePackages_latest.svelte-language-server

      # Java #lsp
      jdt-language-server

      #latex #lsp
      ltex-ls

      # Python #lsp #linter
      pyright
      pylint

      # General LSP #lsp
      vscode-langservers-extracted
      ltex-ls

      # Formatter/Linter #formatter #linter
      nodePackages_latest.prettier
      stylua
      eslint_d
    ];
  };

  home.file.".config/nvim" = {
    source = ./nvim;
    target = ".config/nvim";
    recursive = true;
    executable = true;
  };
}
