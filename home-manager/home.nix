{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    #inputs.nixvim.homeManagerModules.nixvim
    inputs.ags.homeManagerModules.default
    ./features/cli
    ./hyprland/home.nix
    ./nvim/home.nix
    ./waybar/home.nix
    ./mime/home.nix
    ./ags/home.nix
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

  programs.home-manager.enable = true;

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
