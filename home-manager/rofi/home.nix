{pkgs, ...}: let
in {
  nixpkgs.overlays = [
    (final: prev: {
      rofimoji = prev.rofimoji.override {rofi = prev.rofi-wayland;};
    })
    # (final: prev: {
    #   roficalc = prev.rofi-calc.override {rofi = prev.rofi-wayland;};
    # })
    # (final: prev: {
    #   rofipowermenu = prev.rofi-power-menu.override {rofi = prev.rofi-wayland;};
    # })
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  home.packages = with pkgs; [
    rofimoji
    # rofipowermenu
    # roficalc
    # rofi-power-menu
    rofi-bluetooth
  ];

  home.file.".config/rofi" = {
    source = ./rofi;
    target = ".config/rofi";
    recursive = true;
    executable = true;
  };
}
