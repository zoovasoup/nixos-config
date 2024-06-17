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
    ./utils
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

  # ===========================

  users.users = {
    zvasoup = {
      isNormalUser = true;
      shell = "/home/zvasoup/.nix-profile/bin/fish";
      extraGroups = ["networkmanager" "wheel" "keyd" "scanner"];
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
