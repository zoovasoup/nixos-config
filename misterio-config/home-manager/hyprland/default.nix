{ inputs, ... } : {

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [
      inputs.hy3.packages.x86_64-linux.hy3
    ];


  };

  home.file.".config/hypr" = {
    source = ../../config/hypr;
    target = ".config/hypr";
    recursive = true;
    executable = true;
  };

}
