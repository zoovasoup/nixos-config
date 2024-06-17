{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.gnome-software
    gnome.dconf-editor
    gnome-extension-manager
    gnomeExtensions.forge
  ];

  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;
}
