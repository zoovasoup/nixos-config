{...}: {
  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar" = {
    source = ./waybar;
    target = ".config/waybar";
    recursive = true;
    executable = true;
  };
}
