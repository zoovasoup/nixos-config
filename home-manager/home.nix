{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    ./features/cli
    ./nvim/home.nix
    ./waybar/home.nix
    # ./mime/home.nix
    ./rofi/home.nix
    ./swaync/home.nix

    # inputs.ags.homeManagerModules.default
    # ./ags/home.nix
    # ./hyprland/home.nix

    # ./sway/home.nix
    # inputs.nixvim.homeManagerModules.nixvim
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

  # home.sessionVariables.GTK_THEME = "Gruvbox-Dark-BL";

  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    yt-dlp
    vscodium-fhs
    guvcview
    obs-studio
    exercism
    freecad
    # cura
    # prusa-slicer
    partition-manager
    vlc
    wpsoffice
    onlyoffice-bin_latest
    # gromit-mpx
    annotator
    droidcam
    obsidian
    davinci-resolve
    filelight
  ];

  programs.pandoc = {
    enable = true;
  };

  programs.eclipse.enable = true;

  systemd.user.startServices = "sd-switch";

  #home.stateVersion = "23.11";
  home.stateVersion = "24.11";
}
