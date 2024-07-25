{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    #extension stuff
    gnome-tweaks
    gnome.gnome-software
    dconf-editor
    gnome-extension-manager
    gnomeExtensions.forge
    gnomeExtensions.caffeine
    # gnomeExtensions.tilingnome
    gnomeExtensions.status-area-horizontal-spacing
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.color-picker
    gnomeExtensions.dash-to-dock
    gnomeExtensions.ddterm
    gnomeExtensions.bluetooth-quick-connect
    # gnomeExtensions.rounded-window-corners
    gnomeExtensions.paperwm

    #dependencies
    gjs
    vte
    libhandy

    #gnome apps
    gnome-solanum
    gnome-secrets
  ];

  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;
}
