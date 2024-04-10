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
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    #inputs.nixvim.homeManagerModules.nixvim
    ./nixvim
  ];

  nixpkgs = {
    # You can add overlays here
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
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "zvasoup";
    homeDirectory = "/home/zvasoup";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];
  programs.fish = {
    enable = true; 
  };

  home.file.".config/fish" = {
    source = ./config/fish;
    target = ".config/fish";
    recursive = true;
    executable = true;
  };


  programs.fzf = {
    enable = true; 
    enableFishIntegration = true;
    enableBashIntegration = true; 
    enableZshIntegration = true;
  };


  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "zvasoup";
    userEmail = "zulfa.plank@proton.me";
    extraConfig = { init.defaultBranch = "main"; };
  };

  programs.foot = {
    enable = true;
    server.enable = true;
  };

  home.file.".config/foot" = {
    source = ./config/foot;
    target = ".config/foot";
    recursive = true;
    executable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.zathura = {
    enable = true;
  };

  programs.yazi.enable = true;

  programs.mpv.enable = true;
  
  programs.nixvim.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
