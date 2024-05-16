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
    # ./neovim
    ./vimenjoyer-nvim
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

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Gruvbox-Dark-BL";
  #     package = pkgs.gruvbox-gtk-theme-unstable;
  #   };
  # };

  home.sessionVariables.GTK_THEME = "Gruvbox-Dark-BL";

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  programs.home-manager.enable = true;

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

  home.stateVersion = "23.11";
}
