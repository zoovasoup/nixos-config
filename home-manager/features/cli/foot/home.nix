{...}: {
  programs.foot = {
    enable = true;
    server.enable = true;
  };

  home.file.".config/foot" = {
    source = ./foot;
    target = ".config/foot";
    recursive = true;
    executable = true;
  };
}
