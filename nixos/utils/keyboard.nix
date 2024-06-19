{pkgs, ...}: {
  # Configure layout
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh";
  };

  #adding keyd to systemPackages
  environment.systemPackages = with pkgs; [
    keyd
  ];

  # create layer and home-row mod
  services.keyd = {
    enable = true;

    # configure layer
    keyboards = {
      default = {
        ids = ["*"]; #all keyboard

        settings = {
          global = {
            layer_indicator = 1;
          };

          main = {
            capslock = "lettermod(arrow_caps, esc, 100, 160)";
            a = "lettermod(shift, a, 100, 160)";
            s = "lettermod(control, s, 100, 160)";
            d = "lettermod(meta, d, 100, 160)";
            f = "lettermod(alt, f, 100, 160)";
            j = "lettermod(alt, j, 100, 160)";
            k = "lettermod(meta, k, 100, 160)";
            l = "lettermod(control, l, 100, 160)";
            ";" = "lettermod(shift, ;, 100, 160)";
            # "leftalt" = "layer(keys_3)";
            # "rightalt" = "layer(keys_2)";
            # "space" = "overloadt2(shift, space, 180)";
            "\\" = "backspace";
            "backspace" = "\\";
          };

          arrow_caps = {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
          };

          keys_2 = {
            a = "z";
            s = "x";
            d = "c";
            f = "v";
            g = "b";
          };

          keys_3 = {
            h = "n";
            j = "m";
            k = ",";
            l = ".";
            ";" = "/";
          };
        };
      };
    };
  };
}
