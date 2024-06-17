{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./users.nix
    ./hardware-configuration.nix
    inputs.auto-cpufreq.nixosModules.default
    inputs.self.nixosModules.battery-check
    ./system
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  # ==================

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm = {
    enable = true;
    settings = {
      daemon = {
        # AutomaticLogin = "zvasoup";
        # AutomaticLoginEnable = true;
        WaylandEnable = true;
      };
    };
  };
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh";
    options = "caps:escape_shifted_capslock";
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
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
            # "leftalt" = "overloadt2(keys_3, enter, 150)";
            # "rigntalt" = "overloadt2(keys_2, backspace, 150)";
            # o = "overloadi(keys_2, o, 150)";
            # "leftalt" = "enter";
            # "rightalt" = "backspace";
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
          # keys_1 = {
          #   q = "1";
          #   w = "2";
          #   e = "3";
          #   r = "4";
          #   t = "5";
          #   y = "6";
          #   u = "7";
          #   i = "8";
          #   o = "9";
          #   p = "0";
          # };
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # ===========================

  users.users = {
    zvasoup = {
      isNormalUser = true;
      shell = "/home/zvasoup/.nix-profile/bin/fish";
      extraGroups = ["networkmanager" "wheel" "keyd"];
      packages = with pkgs; [
        nerdfonts
        gnome.gnome-tweaks
        gnome.gnome-software
        gnome.dconf-editor
        gnomeExtensions.forge
        libnotify
        gnome-extension-manager
        gruvbox-gtk-theme
        firefox
        tree
        git
        fastfetch
        uwufetch
        uget
        uget-integrator
        nodejs_22
        bun
        cargo
        eslint_d
        pylint
        python312
        python312Packages.pip
        rustup
        clang
        dart-sass
        brightnessctl
        swww
        stylua
        waypaper
        wf-recorder
        hypridle
        # hyprlandPlugins.hy3
        wl-clipboard
        slurp
        hyprpicker
        wayshot
        swappy
        typescript
        inputs.matugen.packages.${pkgs.system}.default
        rofi-wayland
        gtklock
        meson
        swayidle
        # vimPlugins.harpoon2
        udiskie
        arduino
        subversion
        grimblast
        slurp
        nwg-look
        cliphist
        yarn
        # wl-gammarelay-rs
        # hyprshade.override {
        #   hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
        # }
        unzip
        lua-language-server

        #nixd
        #nil
        #alejandra
        #nodePackages_latest.typescript-language-server
        #lua-language-server
        #eslint_d
        #pylint
        #stylua
        acpi
        suwayomi-server
        glow
        vdhcoapp
        libva-utils
        libGL
        gnumake
        gnumake42
        keyd
      ];
    };
  };

  environment.systemPackages = [
    (pkgs.hyprshade.override {
      hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
    })
  ];

  security.pam.services.gtklock = {};

  # programs.home-manager.enable = true;

  services.flatpak.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

  # programs.auto-cpufreq = {
  #   enable = true;
  #   settings = {
  #     battery = {
  #       governor = "powersave";
  #       turbo = "never";
  #       enable_thresholds = true;
  #       start_threshold = "65";
  #       stop_threshold = "81";
  #     };
  #   };
  # };

  # xdg.mime = {
  #   enable = true;
  #   defaultApplications = {
  #     "x-scheme-handler/http" = "com.aborilov.floorp.desktop";
  #     "x-scheme-handler/https" = "com.aborilov.floorp.desktop";
  #     "x-scheme-handler/about" = "com.aborilov.floorp.desktop";
  #     "x-scheme-handler/unknown" = "com.aborilov.floorp.desktop";
  #     "text/html" = "com.aborilov.floorp.desktop";
  #     "application/xhtml+xml" = "com.aborilov.floorp.desktop";
  #   };
  # };

  # modules.battery-check.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
