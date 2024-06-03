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
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.configurationLimit = 15;
  boot.loader.systemd-boot.consoleMode = "max";

  boot.plymouth.enable = true;
  boot.loader.timeout = 1;
  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "systemd.show_status=auto"
    "udev.log_level=3"
    "rd.udev.log_level=3"
    "vt.global_cursor_default=0"
  ];
  boot.consoleLogLevel = 0;

  # ==================

  time.timeZone = "Asia/Singapore";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

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
          main = {
            capslock = "overloadt(arrow_caps, esc, 220)";
            a = "overloadt(shift, a, 220)";
            s = "overloadt(control, s, 220)";
            d = "overloadt(meta, d, 220)";
            f = "overloadt(alt, f, 220)";
            j = "overloadt(alt, j, 220)";
            k = "overloadt(meta, k, 220)";
            l = "overloadt(control, l, 220)";
            ";" = "overloadt(shift, ;, 220)";
            "\\" = "backspace";
            "backspace" = "\\";
          };
          arrow_caps = {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
          };
        };
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 44100;
        "default.clock.quantum" = 512;
        "default.clock.min-quantum" = 512;
        "default.clock.max-quantum" = 512;
      };
    };
  };

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
        keyd
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
        nix-ld
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
      ];
    };
  };

  environment.systemPackages = [
    (pkgs.hyprshade.override {
      hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
    })
  ];

  security.pam.services.gtklock = {};

  services.nextdns = {
    enable = true;
    arguments = ["-config" "nixThinkpad-8f1153.dns.nextdns.io"];
  };

  # programs.home-manager.enable = true;

  services.flatpak.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

  services.power-profiles-daemon = {
    enable = false;
  };

  programs.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
        enable_thresholds = true;
        start_threshold = "65";
        stop_threshold = "81";
      };
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
    ];
  };

  modules.battery-check.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
