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

  #TODO: adding ueburzug++ for yazi and other dependencies for preview (pdf and stuff)

  users.users = {
    zvasoup = let
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

        # cura
      ];
    in {
      isNormalUser = true;
      shell = "/home/zvasoup/.nix-profile/bin/fish";
      extraGroups = ["networkmanager" "wheel" "keyd" "scanner" "bluetooth" "vmware"];
      packages = myApps;
    };
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

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
      "com.google.Chrome"
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

  # modules.battery-check.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
