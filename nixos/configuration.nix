{pkgs, ...}: {
  imports = [
    # ./users.nix
    ./hardware-configuration.nix
    ./system
    ./utils
    ./desktop
  ];

  users.users = {
    zvasoup = {
      isNormalUser = true;
      shell = "/home/zvasoup/.nix-profile/bin/fish";
      extraGroups = ["networkmanager" "wheel" "keyd" "scanner"];
      packages = with pkgs; [
        # Fonts
        nerdfonts

        # Themes
        gruvbox-gtk-theme

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
    };
  };

  services.flatpak.enable = true;

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
