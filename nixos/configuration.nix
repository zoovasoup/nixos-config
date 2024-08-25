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

        # cura
      ];
    in {
      isNormalUser = true;
      shell = "/home/zvasoup/.nix-profile/bin/fish";
      extraGroups = ["networkmanager" "wheel" "keyd" "scanner" "bluetooth"];
      packages = myApps;
    };
  };

  services.flatpak = {
    packages = [
      # "one.ablaze.floorp"
      "io.github.zen_browser.zen"
      "org.learningequality.Kolibri"
      "so.libdb.dissent"
      "com.usebottles.bottles"
      "app.ytmdesktop.ytmdesktop"
      "com.github.mdh34.quickdocs"
      "io.gitlab.news_flash.NewsFlash"
      "org.gaphor.Gaphor"
      "com.belmoussaoui.Obfuscate"
    ];
  };

  # xdg.portal.wlr.enable = lib.mkForce true;

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
