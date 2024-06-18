{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
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
      nodePackages_latest.vscode-html-languageserver-bin
      emmet-ls

      # CSS #lsp
      tailwindcss-language-server
      nodePackages_latest.vscode-css-languageserver-bin

      # GraphQL #lsp
      nodePackages_latest.graphql-language-service-cli

      # Svelte #lsp
      nodePackages_latest.svelte-language-server

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

  # home.file.".config/nvim" = {
  #   source = ./config/nvim;
  #   target = ".config/nvim";
  #   recursive = true;
  #   executable = true;
  # };
}
