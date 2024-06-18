{...}: {
  programs.fish = {
    enable = true;
  };

  home.file.".config/fish" = {
    source = ./fish;
    target = ".config/fish";
    recursive = true;
    executable = true;
  };
}
