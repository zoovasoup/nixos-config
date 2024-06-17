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
            capslock = "lettermod(arrow_caps, esc, 80, 160)";
            a = "lettermod(shift, a, 90, 150)";
            s = "lettermod(control, s, 90, 150)";
            d = "lettermod(meta, d, 90, 150)";
            f = "lettermod(alt, f, 90, 150)";
            j = "lettermod(alt, j, 90, 150)";
            k = "lettermod(meta, k, 90, 150)";
            l = "lettermod(control, l, 90, 150)";
            ";" = "lettermod(shift, ;, 90, 150)";
            "leftalt" = "layer(keys_3)";
            "rightalt" = "layer(keys_2)";
            "space" = "overloadt2(shift, space, 180)";
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
