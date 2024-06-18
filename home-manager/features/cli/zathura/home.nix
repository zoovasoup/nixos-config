{...}: {
  programs.zathura = {
    enable = true;
  };

  home.file.".config/zathura" = {
    source = ./zathura;
    target = ".config/zathura";
    recursive = true;
    executable = true;
  };
}
