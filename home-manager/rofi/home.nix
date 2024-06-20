{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-power-menu
      rofi-calc
      rofi-emoji
      rofi-bluetooth
    ];
  };

  home.file.".config/rofi" = {
    source = ./rofi;
    target = ".config/rofi";
    recursive = true;
    executable = true;
  };
}
