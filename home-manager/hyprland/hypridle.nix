{...}: {
  home.file.".config/hypr/hypridle.conf" = {
    source = ./hypr/hypridle.conf;
    target = ".config/hypr/hypridle.conf";
    recursive = true;
    executable = true;
  };
}
