{pkgs, ...}: {
  # Configure layout
  services.xserver.xkb = {
    layout = "us";
    # variant = "colemak_dh";
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
            default_layout = "colemak_dh";
          };

          main = {
            capslock = "overloadt2(arrow_caps, esc, 155)";
            a = "lettermod(shift, a, 200, 165)";
            s = "lettermod(control, r, 200, 165)";
            d = "lettermod(meta, s, 200, 165)";
            f = "lettermod(alt, t, 200, 165)";
            j = "lettermod(alt, n, 200, 165)";
            k = "lettermod(meta, e, 200, 165)";
            l = "lettermod(control, i, 200, 165)";
            ";" = "lettermod(shift, o, 200, 165)";
            # "leftalt" = "layer(keys_3)";
            # "rightalt" = "layer(keys_2)";
            # "space" = "overloadt2(shift, space, 180)";
            "\\" = "backspace";
            "backspace" = "\\";
          };

          control = {
            "1" = "setlayout(colemak_dh)";
            "2" = "setlayout(main)";
          };

          "colemak_dh:layout" = {
            q = "q";
            w = "w";
            e = "f";
            r = "p";
            t = "b";
            y = "j";
            u = "l";
            i = "u";
            o = "y";
            p = ";";
            g = "g";
            h = "m";
            z = "x";
            x = "c";
            c = "d";
            v = "v";
            b = "z";
            n = "k";
            m = "h";
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
