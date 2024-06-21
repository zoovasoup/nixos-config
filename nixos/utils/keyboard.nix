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
            a = "lettermod(shift, a, 100, 165)";
            s = "lettermod(control, r, 100, 165)";
            d = "lettermod(meta, s, 100, 165)";
            f = "lettermod(alt, t, 100, 165)";
            j = "lettermod(alt, n, 100, 165)";
            k = "lettermod(meta, e, 100, 165)";
            l = "lettermod(control, i, 100, 165)";
            ";" = "lettermod(shift, o, 100, 165)";
            "leftalt" = "layer(num_pad)";
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

          num_pad = {
            u = "9";
            i = "8";
            o = "7";
            j = "6";
            k = "5";
            l = "4";
            m = "3";
            "," = "2";
            "." = "1";
            h = "0";
          };
        };
      };
    };
  };
}
