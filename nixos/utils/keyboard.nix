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
        ids = [" 0001:0001:a38e6885"]; #keyboard bawaan

        settings = {
          global = {
            layer_indicator = 1;
            default_layout = "colemak_dh";
          };

          main = {
            # capslock = "overloadt2(arrow_caps, esc, 155)";
            # a = "lettermod(shift, a, 95, 155)";
            # s = "lettermod(control, r, 95, 155)";
            # d = "lettermod(meta, s, 95, 155)";
            # f = "lettermod(alt, t, 95, 155)";
            # j = "lettermod(alt, n, 95, 155)";
            # k = "lettermod(meta, e, 95, 155)";
            # l = "lettermod(control, i, 95, 155)";
            # ";" = "lettermod(shift, o, 95, 155)";
            # "leftalt" = "layer(num_pad)";
            # "rightalt" = "layer(keys_2)";
            # "space" = "overloadt2(shift, space, 180)";
            # "\\" = "backspace";
            # "backspace" = "\\";
            # "control" = "layer(control)";
          };

          control = {
            "1" = "setlayout(colemak_dh)";
            "2" = "setlayout(qwerty)";
            "3" = "setlayout(gaming)";
          };

          "gaming:layout" = {
            q = "q";
            w = "w";
            e = "e";
            r = "r";
            t = "t";
            y = "y";
            u = "u";
            i = "i";
            o = "o";
            p = "p";
            a = "a";
            s = "s";
            d = "d";
            f = "f";
            g = "g";
            h = "h";
            j = "j";
            k = "k";
            l = "l";
            ";" = ";";
            z = "z";
            x = "x";
            c = "c";
            v = "v";
            b = "b";
            n = "n";
            m = "m";
          };

          "qwerty:layout" = {
            q = "q";
            w = "w";
            e = "e";
            r = "r";
            t = "t";
            y = "y";
            u = "u";
            i = "i";
            o = "o";
            p = "p";
            g = "g";
            h = "h";
            z = "z";
            x = "x";
            c = "c";
            v = "v";
            b = "b";
            n = "n";
            m = "m";

            capslock = "overloadt2(arrow_caps, esc, 155)";
            a = "lettermod(shift, a, 95, 155)";
            s = "lettermod(control, s, 95, 155)";
            d = "lettermod(meta, d, 95, 155)";
            f = "lettermod(alt, f, 95, 155)";
            j = "lettermod(alt, j, 95, 155)";
            k = "lettermod(meta, k, 95, 155)";
            l = "lettermod(control, l, 95, 155)";
            ";" = "lettermod(shift, ;, 95, 155)";
            "leftalt" = "layer(num_pad)";
            "\\" = "backspace";
            "backspace" = "\\";
            "control" = "layer(control)";
            "esc" = "capslock";
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

            capslock = "overloadt2(arrow_caps, esc, 155)";
            a = "lettermod(shift, a, 95, 155)";
            s = "lettermod(control, r, 95, 155)";
            d = "lettermod(meta, s, 95, 155)";
            f = "lettermod(alt, t, 95, 155)";
            j = "lettermod(alt, n, 95, 155)";
            k = "lettermod(meta, e, 95, 155)";
            l = "lettermod(control, i, 95, 155)";
            ";" = "lettermod(shift, o, 95, 155)";
            "leftalt" = "layer(num_pad)";
            # "rightalt" = "layer(keys_2)";
            # "space" = "overloadt2(shift, space, 180)";
            "\\" = "backspace";
            "backspace" = "\\";
            "control" = "layer(control)";
            "esc" = "capslock";
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
            o = "3";
            i = "2";
            u = "1";
            l = "6";
            k = "5";
            j = "4";
            "." = "9";
            "," = "8";
            m = "7";
            h = "0";
          };
        };
      };
    };
  };

  # udev settup for vial
  services.udev = {
    enable = true;
    extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };
}
