{pkgs, ...}: {
  programs.sway = {
    enable = true;

    #using swayfx instead sway
    package = pkgs.swayfx;

    extraPackages = with pkgs; [
      #utils
      wlrctl
      blueman
      libnotify
      # mako

      #i3 stuff
      i3status-rust

      #sway stuff
      swaybg
      swayidle
      sway-audio-idle-inhibit
      swaynag-battery
      swaylock-effects

      #nwg stuff
      nwg-bar
      nwg-menu
      nwg-panel
      nwg-drawer
      nwg-wrapper
      nwg-displays
      nwg-launchers
    ];
  };

  environment.systemPackages = with pkgs; [
    # wl-gammactl
    wl-gammarelay-rs
    polkit_gnome
  ];

  programs.nm-applet.indicator = true;
}
