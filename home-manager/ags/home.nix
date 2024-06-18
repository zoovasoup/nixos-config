{
  pkgs,
  inputs,
  ...
}: {
  programs.ags = let
    # Inputs (specific to your system)
    matugen = [inputs.matugen.packages.${pkgs.system}.default];

    # dependencies
    listPkgs = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  in {
    enable = true;

    extraPackages = matugen ++ listPkgs;
  };

  home.file.".config/ags" = {
    source = ./ags;
    target = ".config/ags";
    recursive = true;
    executable = true;
  };
}
