{...}: {
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.libinput.mouse.accelProfile = "flat";
  services.libinput.touchpad.accelProfile = "flat";
  # services.xserver.synaptics.enable = true;
}
