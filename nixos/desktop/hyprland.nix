{
  inputs,
  pkgs,
  ...
}: let
  # NOTE: remove this later when hyprland is stable
  # override hyprshade because hyprland is broken
  hyprshadePkg = [
    (pkgs.hyprshade.override {
      hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
    })
  ];

  additionalPkgs = with pkgs; [
    # app launcher
    rofi-wayland

    # wallpaper init
    swww

    # idle and lock
    gtklock
    hypridle

    # clipbloard
    cliphist

    # screeshoot
    grimblast
    slurp

    #gtk theming
    nwg-look

    wf-recorder
    wl-clipboard
    hyprpicker
    brightnessctl
  ];
in {
  # add some pkgs
  environment.systemPackages = hyprshadePkg ++ additionalPkgs;

  # enable hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

  # lock-screen
  security.pam.services.gtklock = {};
}
