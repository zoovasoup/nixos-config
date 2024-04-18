{ inputs, ... } : {

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [
      inputs.hy3.packages.x86_64-linux.hy3
    ];

    settings = {
      atogenerated = "0";
      
      monitor = "eDP-1, 1920x1080@60, auto, 1";

      "$terminal" = "foot";
      "$fileManager" = "natutilus";
      "$menu" = "rofi";

      input = {
        kb_layout = "us";
        kb_variant = "colemak_dh";

        follow_mouse = "1"; 

        accel_profile = "flat";
        sensitivity = "1.5";
        natural_scroll = true;

        touchpad = {
          natural_scroll = false; 
          scroll_factor = "1";
        };
      };

      general = {
        gaps_in = "3";
        gaps_out = "7"; 
        border_size = "3";
        "col.active_border" = "rgba(fabd2fee)";
        "col.inactive_border" = "rgba(282828ee)";
        no_cursor_wraps = false;
        cursor_inactive_timeout = "5";

        # layout = "hy3";
        layout = "dwindle";

        allow_tearing = false;
      };

      decoration = {
        rounding = "0";
        drop_shadow = "no";
        blur = {
          enabled = true;
          size = "12";
          passes = "2";
        };
      };

      animations = {
        enabled = "yes";

        bezier = "myBezier, 0, 1, 0, 1";
        # bezier = "testBezier, 0.455, 0.03, 0.515, 0.955";

        animation = [
          "windows, 1, 1.5, myBezier, slide"
          "wondowsOut, 1, 1.5, myBezier, slide"
          "border, 1, 3, default"
          "borderangle, 1, 8, default"
          "fade, 1, 2, default"
          "workspaces, 1, 1.5, myBezier, slide"
          "specialWorkspace, 1, 3,1 myBezier, fade"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        master = {
          new_is_master = false;
          mfact = "0.6";
        };
      };

      gestures = {
        workspace_swipe = "on";
        workspace_swipe_fingers = "4";
        workspace_swipe_min_speed_to_force = "10";
        workspace_swipe_invert = false;
      };

      misc = {
        force_default_wallpaper = "1";
      };

      binds = {
        allow_workspace_cycles = false;
        workspace_center_on = "1";
        movefocus_cycles_fullscreen = true;
      };

      "device:epic-mouse-v1" = {
        sensitivity = "-0.5";
      };

      plugin = {
        hy3 = {
          no_gaps_when_only = false;
          node_collapse_policy = "2";
          group_inset = "10";
          tab_first_window = false;
          tabs = {
            height = "4";
            padding = "5";
            rounding = "0";
            "col.active" = "rgba(b8bb26ee)";
            "col.urgent" = "rgba(cc24udee)";
            "col.inactive" = "rgba(282828ee)";
            render_text = false;
          };

          autotile = {
            enable = true;
            ephemeral_groups = false;
            trigger_width = "500";
            trigger_height = "1";
            workspaces = "all";
          };
        };
      };

      windowrulev2 = [
        # firefox pip
        "float, class:firefox, title:Picture-inPicture"
        "pin, class:firefox, title:Picture-inPicture"
        "size 20%, class:firefox, title:Picture-inPicture"
        
        # floorp pip
        "float, class:floorp, title:Picture-inPicture"
        "pin, class:floor, title:Picture-inPicture"
        "size 20%, class:floorp, title:Picture-inPicture"

        # pavucontrol
        "float, class:(pavucontrol:"
        "move 1310 40, class:(pavucontrol:"
        "size 600 300, class:(pavucontrol)"

        # blueman-manager
        "float, class:(blueman-manager)"
        "move 1310 40, class:(blueman-manager)"
        "size 600 300, class:(blueman-manager)"

        # scratchpad
        "float, class:(scratchpad)"
        "center, class:(scratchpad)"
        "size 50% 40%, class:(scratchpad)"
        "workspace special:magic silent, class:(scratchpad)"

        # scratchpad-yazi
        "float, class:(scratchpad-fm)"
        "center, class:(scratchpad-fm)"
        "size 50% 40%, class:(scratchpad-fm)"
        "workspace special:magic silent, class:(scratchpad-fm)"
      ];

      # mod keys
      "$mainMod" = "ALT";
      "$secondMod" = "SUPER";

      bind = [
        "$mainMod, q, killactive, "

        "$secondMod, RETURN, exec, $terminal"
        "$mainMod, space, exec, $menu"

        "$mainMod, r, fullscreen, 0"
        "$mainMod, s, togglefloating, "
        
        # dwindle
        "$mainMod, J togglesplit, "
        "$mainMod, p, pin, "

        # resize window
        "$mainMod, l, resizeactive, 150 0"
        "$mainMod, l, resizeactive, -150 0"
        "$mainMod, u, resizeactive, 0 150"
        "$mainMod, u, resizeactive, 0 -150"

        # move window focus
        "$mainMod, m, movefocus, l"
        "$mainMod, n, movefocus, r"
        "$mainMod, e, movefocus, u"
        "$mainMod, i, movefocus, d"

        # move active window to workspace 
        "$mainMod SHIFT, k, movetoworkspace, e-1"
        "$mainMod SHIFT, h, movetoworkspace, e+1"

        # "$mainMod SHIFT, k, movetoworkspace, r-1"
        # "$mainMod SHIFT, h, movetoworkspace, r+1"

        "$mainMod, 1, movetoworkspace, 1"
        "$mainMod, 2, movetoworkspace, 2"
        "$mainMod, 3, movetoworkspace, 3"
        "$mainMod, 4, movetoworkspace, 4"
        "$mainMod, 5, movetoworkspace, 5"
        "$mainMod, 6, movetoworkspace, 6"
        "$mainMod, 7, movetoworkspace, 7"
        "$mainMod, 8, movetoworkspace, 8"
        "$mainMod, 9, movetoworkspace, 9"
        "$mainMod, 0, movetoworkspace, 0"

        # switch active workspaces
        # "$mainMod, k, workspace e-1"
        # "$mainMod, h, workspace e+1"

        # switch relative workspaces
        "$mainMod, k, workspace r-1"
        "$mainMod, h, workspace r+1"

        # switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 0"

        # scratchpad
        "$mainMod, space, togglespecialworkspace, magic"
        "$mainMod, backslash, togglespecialworkspace, fm"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      exec-once = [
        "foot --server"
        "[workspace special:magic silent] foot --app-id=scratchpad"
        "[workspace special:fm silent] foot --app-id=scratchpad-fm -e yazi"
      ];

    };

    extraConfig = ''
      plugin = ${inputs.hy3.packages.x86_64-linux.hy3}/lib/libhy3.so
    '';
  };

  # home.file.".config/hypr" = {
  #   source = ../../config/hypr;
  #   target = ".config/hypr";
  #   recursive = true;
  #   executable = true;
  # };

}
