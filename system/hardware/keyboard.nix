{ ... }: {
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh";
    options = "caps:escape_shifted_capslock";
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = { capslock = "overload(caps_layer, esc)"; };
          caps_layer = {
            m = "left";
            n = "down";
            e = "up";
            i = "right";
          };
        };
      };
    };
  };
}
