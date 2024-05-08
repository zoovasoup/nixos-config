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
  services.xserver.displayManager.gdm.enable = true;
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
        ids = [ "*" ];
        settings = {
          main = { 
            capslock = "overload(caps_layer, esc)";
            };
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
    pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
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
      ];
    };
  };

  security.pam.services.gtklock = {};

  services.nextdns = {
    enable = true;
    arguments = [ "-config" "nixThinkpad-8f1153.dns.nextdns.io" ];
  };

  # programs.home-manager.enable = true;  

  services.flatpak.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };



# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
