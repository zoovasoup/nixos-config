{...}: {
  programs.yazi = {
    enable = true;
  };

  home.file.".config/yazi" = {
    source = ./yazi;
    target = ".config/yazi";
    recursive = true;
    executable = true;
  };
}
