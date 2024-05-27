{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    #inputs.nixvim.homeManagerModules.nixvim
    # ./nixvim
    #./neovim
     # ./vimenjoyer-nvim
    ./features/cli
    ./hyprland
    inputs.ags.homeManagerModules.default
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "zvasoup";
    homeDirectory = "/home/zvasoup";
  };

  home.sessionVariables.GTK_THEME = "Gruvbox-Dark-BL";

  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    ytui-music
    ytermusic
  ];

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      #lsp
      nixd
      nil
      alejandra
      typescript
      nodePackages_latest.typescript-language-server
      lua-language-server
      nodePackages_latest.vscode-html-languageserver-bin
      # nodePackages_latest.tailwindcss
      tailwindcss-language-server
      nodePackages_latest.vscode-css-languageserver-bin
      nodePackages_latest.graphql-language-service-cli
      nodePackages_latest.svelte-language-server
      emmet-ls
      pyright
      vscode-langservers-extracted

      #formatter/linter
      nodePackages_latest.prettier
      eslint_d
      pylint
      stylua
    ];
  };

  # home.file.".config/nvim" = {
  #   source = ./config/nvim;
  #   target = ".config/nvim";
  #   recursive = true;
  #   executable = true;
  # };

  programs.waybar = {
    enable = true;
  };
  home.file.".config/waybar" = {
    source = ./config/waybar;
    target = ".config/waybar";
    recursive = true;
    executable = true;
  };

  home.file.".config/hypr/hypridle.conf" = {
    source = ./config/hypr/hypridle.conf;
    target = ".config/hypr/hypridle.conf";
    recursive = true;
    executable = true;
  };

  systemd.user.startServices = "sd-switch";

  #home.stateVersion = "23.11";
  home.stateVersion = "24.11";
}
