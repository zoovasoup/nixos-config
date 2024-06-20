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
      #NOTE : floorp follow nixos-unstable-small
      # remove this after the floorp 11.14 got merged to nixos-unstable
      newFloorp = [inputs.nixpkgs-unstable-small.legacyPackages.x86_64-linux.floorp];

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

        # Other
        suwayomi-server
      ];
    in {
      isNormalUser = true;
      shell = "/home/zvasoup/.nix-profile/bin/fish";
      extraGroups = ["networkmanager" "wheel" "keyd" "scanner"];
      packages = myApps ++ newFloorp;
    };
  };

  services.flatpak = {
    packages = [
      # "one.ablaze.floorp"
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
