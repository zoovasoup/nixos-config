{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # ./users.nix
    ./hardware-configuration.nix
    ./system
    ./utils
    ./desktop
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  nixpkgs.config.permittedInsecurePackages = ["openssl-1.1.1w"];

  #TODO: adding ueburzug++ for yazi and other dependencies for preview (pdf and stuff)

  users.users = {
    zvasoup = let
      wkhtmltopdf_custom = pkgs.wkhtmltopdf.overrideAttrs (oldAttrs: rec {
        version = "0.12.5"; # Your desired version
        src = pkgs.fetchurl {
          # url = "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb";
          # hash = "sha256-36tVBhBER+7yUw0a25hA7jpn8wyqrV6by4dD7y+UIb0=";

          url = "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb";
          hash = "sha256-20j6GgQzCcS/6Mjg443AbBg/ghWZ3YjU486kfFpdTNM=";

          # url = "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.jammy_amd64.deb";
          # hash = "sha256-T3I7JpGthjip35YOBCHTRtcxUIPjWDozTzM2IoDduhU=";
        };

        buildInputs =
          oldAttrs.buildInputs
          ++ [
            pkgs.openssl_1_1
            pkgs.libjpeg8
          ];
      });

      myApps = with pkgs; [
        # Fonts
        nerdfonts

        # Browsers
        firefox

        vdhcoapp

        # JavaScript/Node.js #framework #runtime
        nodejs_22
        bun
        yarn
        typescript

        # Web development #tool
        dart-sass
        python311Packages.sip4
        # python

        #keyboard stuff
        qmk
        vial

        # Other
        suwayomi-server

        # wallpaper init
        swww

        # clipbloard
        cliphist

        # screeshoot
        grimblast
        slurp

        #gtk theming
        nwg-look

        # Notifications
        libnotify

        wf-recorder
        wl-clipboard
        brightnessctl
        udiskie
        sassc
        gtk-engine-murrine
        wget
        warpd
        floorp
        teams
        teams-for-linux
        whatsapp-for-linux
        kdenlive
        atlauncher

        jdt-language-server
        corefonts
        vistafonts

        temurin-jre-bin-21
        javaPackages.openjfx21
        jdk21
        cairo
        gnome2.pango
        freetype
        winetricks
        bottles
        sdkmanager
        zip
        gradle
        discord
        vesktop
        ghidra
        # ida-free
        # zed-editor
        gamemode
        mangohud
        swiProlog
        swiPrologWithGui

        scid
        scid-vs-pc
        xboard
        libwacom
        tetrio-desktop
        piper
        openrazer-daemon
        polychromatic
        gh
        docker
        docker-compose
        docker-compose-language-service
        postgresql
        google-chrome
        lazygit
        direnv
        presenterm
        slides
        graph-easy
        gcc
        jetbrains.pycharm-community
        postgresql
        odoo
        python312
        python312Packages.pip
        pyenv
        gnumake
        gcc
        gnumake
        zlib
        libffi
        readline
        bzip2
        openssl
        ncurses
        virtualenv
        python312Packages.jedi-language-server
        python312Packages.python-lsp-server

        # cura
      ];
    in {
      isNormalUser = true;
      shell = "/home/zvasoup/.nix-profile/bin/fish";
      extraGroups = ["networkmanager" "wheel" "keyd" "scanner" "bluetooth" "vmware" "openrazer" "docker"];
      packages =
        myApps
        ++ [
          wkhtmltopdf_custom
        ];
    };
  };

  services.postgresql.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  hardware.openrazer = {
    enable = true;
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  virtualisation.docker.enable = true;

  services.flatpak = {
    packages = [
      "net.christianbeier.Gromit-MPX"
      # "one.ablaze.floorp"
      "io.github.zen_browser.zen"
      "org.learningequality.Kolibri"
      "so.libdb.dissent"
      "app.ytmdesktop.ytmdesktop"
      "com.github.mdh34.quickdocs"
      "io.gitlab.news_flash.NewsFlash"
      "org.gaphor.Gaphor"
      "com.belmoussaoui.Obfuscate"
      "io.github.spacingbat3.webcord"
      "com.github.tchx84.Flatseal"
      "org.freedesktop.Platform.ffmpeg-full/x86_64/23.08"
      "us.zoom.Zoom"
    ];
  };

  # xdg.portal.wlr.enable = lib.mkForce true;

  programs.firejail.enable = true;

  programs.adb.enable = true;

  xdg.portal = {
    enable = true;
    # extraPortals = with pkgs; [
    #   xdg-desktop-portal-gtk
    #   xdg-desktop-portal-hyprland
    # ];
    wlr.enable = lib.mkForce true;
    xdgOpenUsePortal = true;
  };

  systemd.user.services."xdg-desktop-portal-gnome".serviceConfig = {
    WantedBy = ["default.target"];
    Requisite = "gnome-session-initialized.target";
    After = ["gnome-session-initialized.target"];
  };

  environment.sessionVariables = {
    PYENV_ROOT = "$HOME/.pyenv";
    # pyenv flags to be able to install Python
    CPPFLAGS = "-I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include";
    CXXFLAGS = "-I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include";
    CFLAGS = "-I${pkgs.openssl.dev}/include";
    LDFLAGS = "-L${pkgs.zlib.out}/lib -L${pkgs.libffi.out}/lib -L${pkgs.readline.out}/lib -L${pkgs.bzip2.out}/lib -L${pkgs.openssl.out}/lib";
    CONFIGURE_OPTS = "-with-openssl=${pkgs.openssl.dev}";
    PYENV_VIRTUALENV_DISABLE_PROMPT = "1";
  };

  # modules.battery-check.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
