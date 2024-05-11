# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    #inputs.nixvim.homeManagerModules.nixvim
    ./nixvim
    ./features/cli
    ./hyprland
    inputs.ags.homeManagerModules.default
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
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
