# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
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
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "zvasoup";
    homeDirectory = "/home/zvasoup";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    typescript
    nodePackages.typescript-language-server
    eslint_d
    nodePackages.prettier

    # lua
    lua-language-server
    lua54Packages.luacheck
    stylua

    # nix
    nil
    nixfmt
    nixpkgs-fmt
    xz

    yazi
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "zvasoup";
    userEmail = "zulfa.plank@proton.me";
    extraConfig = { init.defaultBranch = "main"; };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
