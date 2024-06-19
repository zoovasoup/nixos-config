{pkgs, ...}: {
  programs.sway = {
    enable = true;

    #using swayfx instead sway
    package = pkgs.swayfx;

    extraPackages = with pkgs; [
      #utils

      #sway stuff
      swaybg
      swaynotificationcenter
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
}
