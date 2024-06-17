{...}: {
  # Enable gdm
  services.xserver.displayManager.gdm = {
    enable = true;
    settings = {
      daemon = {
        WaylandEnable = true;
      };
    };
  };
}
