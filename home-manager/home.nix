{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    #inputs.nixvim.homeManagerModules.nixvim
    ./features/cli
    ./hyprland
    ./nvim/home.nix
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

  programs.ags = let
    # Inputs (specific to your system)
    matugen = inputs.matugen.packages.${pkgs.system}.default;

    listPkgs = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  in {
    enable = true;
    extraPackages = matugen ++ listPkgs;
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

  # xdg.mime.enable = true;

  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #     "x-scheme-handler/http" = "one.ablaze.floorp";
  #     "x-scheme-handler/https" = "one.ablaze.floorp";
  #     "x-scheme-handler/about" = "one.ablaze.floorp";
  #     "x-scheme-handler/unknown" = "one.ablaze.floorp";
  #     "text/html" = "one.ablaze.floorp";
  #     "application/xhtml+xml" = "one.ablaze.floorp";
  #   };
  # };

  # programs.texlive = {
  #   enable = true;
  # };

  programs.pandoc = {
    enable = true;
  };

  systemd.user.startServices = "sd-switch";

  #home.stateVersion = "23.11";
  home.stateVersion = "24.11";
}
