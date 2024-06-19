{pkgs, ...}: {
  programs.yazi = {
    enable = true;
  };

  home.packages = with pkgs; [
    ueberzugpp
  ];

  home.file.".config/yazi" = {
    source = ./yazi;
    target = ".config/yazi";
    recursive = true;
    executable = true;
  };
}
