{
  inputs,
  pkgs,
  ...
}: let
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hy3.packages.x86_64-linux.hy3
    ];

    settings = {
      exec-once = [
        "waybar"
        "hypridle"
        "ags"
        "foot --server"
        "swayidle -w timeout 300 'gtklock -d' timeout 360 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'"
        "swww init"
        "[workspace special:magic silent] foot --app-id=scratchpad -e tmux"
        "[workspace special:fm silent] foot --app-id=scratchpad-fm -e yazi"
        "udiskie"
        "hyprshade toggle blue-light-filter"
      ];
      autogenerated = "0";

      monitor = "eDP-1, 1920x1080@60, auto, 1";

      "$terminal" = "foot";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun";

      input = {
        kb_layout = "us";
        kb_variant = "colemak_dh";

        follow_mouse = "1";

        accel_profile = "flat";
        sensitivity = "0.7";
        natural_scroll = true;

        touchpad = {
          natural_scroll = false;
          scroll_factor = "1";
        };
      };

      general = {
        gaps_in = "0";
        gaps_out = "0";
        border_size = "3";
        "col.active_border" = "rgba(d79921ee)";
        "col.inactive_border" = "rgba(282828ee)";

        layout = "hy3";
        #layout = "dwindle";

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
          "windowsOut, 1, 1.5, myBezier, slide"
          "border, 1, 3, default"
          "borderangle, 1, 8, default"
          "fade, 1, 2, default"
          "workspaces, 1, 1.5, myBezier, slide"
          "specialWorkspace, 1, 3, myBezier, fade"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        # new_is_master = false;
        mfact = "0.6";
      };

      plugin = {
        hy3 = {
          no_gaps_when_only = true;
          node_collapse_policy = "2";
          group_inset = "5";
          tab_first_window = false;
          tabs = {
            height = "4";
            padding = "0";
            rounding = "0";
            "col.active" = "rgba(d79921ee)";
            "col.inactive" = "rgba(282828ee)";
            "col.urgent" = "rgba(cc24udee)";
            render_text = false;
          };
          autotile = {
            enable = true;
            ephmeral_group = false;
            trigger_width = "500";
            trigger_height = "1";
            workspace = "all";
          };
        };
      };

      gestures = {
        workspace_swipe = "on";
        workspace_swipe_fingers = "4";
        workspace_swipe_min_speed_to_force = "10";
        workspace_swipe_invert = false;
      };

      misc = {
        force_default_wallpaper = "0";
      };

      binds = {
        allow_workspace_cycles = false;
        workspace_center_on = "1";
        movefocus_cycles_fullscreen = true;
      };

      #"device:epic-mouse-v1" = {
      device = {
        name = "synps/2-synaptics-touchpad";
        sensitivity = "0.5";
      };

      group = {
        groupbar = {
          render_titles = false;
          gradients = false;
          "col.active" = "rgba(fabd2fee)";
          "col.inactive" = "rgba(282828ee)";
        };
      };

      windowrulev2 = [
        "nomaxsize, class:.*"
        # firefox pip
        "float, class:firefox, title:Picture-in-Picture"
        "pin, class:firefox, title:Picture-in-Picture"
        "size 20%, class:firefox, title:Picture-in-Picture"
        "move 79%, class:firefox, title:Picture-in-Picture"

        # floorp pip
        "float, class:floorp, title:Picture-in-Picture"
        "pin, class:floor, title:Picture-in-Picture"
        "size 20%, class:floorp, title:Picture-in-Picture"
        "move 79%, class:floorp, title:Picture-in-Picture"

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
        "size 60% 50%, class:(scratchpad)"
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
        # "$mainMod, q, killactive, "
        "$mainMod, q, hy3:killactive, "
        "$secondMod, RETURN, exec, $terminal"
        "$secondMod, space, exec, $menu"

        "$mainMod, r, fullscreen, 0"
        "$mainMod, s, togglefloating, "

        "$secondMod, l, exec, gtklock"

        # "$mainMod, ;, exec, ags -t quicksettings"
        # "$mainMod, y, exec, ags -t datemenu"

        # dwindle
        "$mainMod, J, togglesplit, "
        "$mainMod, p, pin, "

        # resize window
        "$mainMod, l, resizeactive, 150 0"
        "$mainMod SHIFT, l, resizeactive, -150 0"
        "$mainMod, u, resizeactive, 0 150"
        "$mainMod SHIFT, u, resizeactive, 0 -150"

        # move window focus
        # "$mainMod, m, movefocus, l"
        # "$mainMod, n, movefocus, d"
        # "$mainMod, e, movefocus, u"
        # "$mainMod, i, movefocus, r"

        "$mainMod, m, hy3:movefocus, l"
        "$mainMod, n, hy3:movefocus, d"
        "$mainMod, e, hy3:movefocus, u"
        "$mainMod, i, hy3:movefocus, r"

        #group
        "$mainMod, t, hy3:makegroup, tab, ephemeral, "

        # move active window to workspace
        "$mainMod SHIFT, k, hy3:movetoworkspace, e-1, follow"
        "$mainMod SHIFT, h, hy3:movetoworkspace, e+1, follow"

        "$secondMod SHIFT, k, hy3:movetoworkspace, r-1, follow"
        "$secondMod SHIFT, h, hy3:movetoworkspace, r+1, follow"

        "$mainMod SHIFT, 1, hy3:movetoworkspace, 1"
        "$mainMod SHIFT, 2, hy3:movetoworkspace, 2"
        "$mainMod SHIFT, 3, hy3:movetoworkspace, 3"
        "$mainMod SHIFT, 4, hy3:movetoworkspace, 4"
        "$mainMod SHIFT, 5, hy3:movetoworkspace, 5"
        "$mainMod SHIFT, 6, hy3:movetoworkspace, 6"
        "$mainMod SHIFT, 7, hy3:movetoworkspace, 7"
        "$mainMod SHIFT, 8, hy3:movetoworkspace, 8"
        "$mainMod SHIFT, 9, hy3:movetoworkspace, 9"
        "$mainMod SHIFT, 0, hy3:movetoworkspace, 10"

        # switch active workspaces
        "$mainMod, k, workspace, e-1"
        "$mainMod, h, workspace, e+1"

        # switch relative workspaces
        "$secondMod, k, workspace, r-1"
        "$secondMod, h, workspace, r+1"

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
        "$mainMod, 0, workspace, 10"

        #hy3
        "$mainMod, v, hy3:makegroup, v, ephmeral"
        "$mainMod, d, hy3:makegroup, h, ephmeral"
        "$mainMod, t, hy3:makegroup, tab, ephmeral"
        "$mainMod, tab, hy3:changegroup, toggletab"

        "$secondMod, m, hy3:movewindow, l, once, visible"
        "$secondMod, n, hy3:movewindow, d, once, visible"
        "$secondMod, e, hy3:movewindow, u, once, visible"
        "$secondMod, i, hy3:movewindow, r, once, visible"

        # scratchpad
        "$mainMod, space, togglespecialworkspace, magic"
        "$mainMod, backslash, togglespecialworkspace, fm"

        "SUPER, R,       exec, ags -t launcher"
        ",XF86PowerOff,  exec, ags -t powermenu"
        "SUPER, Tab,     exec, ags -t overview"

        ",print , exec, grimblast copysave output"
        "SHIFT ,print , exec, grimblast copysave area"
        "$mainMod SHIFT ,print , exec, grimblast copysave active"
        "$secondMod SHIFT ,print , exec, grimblast copysave area"
        ",XF86favorites, exec, ags -t quicksettings"
        ",XF86messenger, exec, ags -t datemenu"
        ",XF86phone, exec, hyprshade toggle ~/.config/hypr/shaders/grayscale.glsl"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindle = [
        ",XF86MonBrightnessUp,   exec, ${brightnessctl} set +5%"
        ",XF86MonBrightnessDown, exec, ${brightnessctl} set  5%-"
        ",XF86AudioRaiseVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
        ",XF86AudioMute, exec, ${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
        ",XF86AudioMicMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
      ];
    };
  };

  # home.file.".config/hypr" = {
  #   source = ../../config/hypr;
  #   target = ".config/hypr";
  #   recursive = true;
  #   executable = true;
  # };
}
