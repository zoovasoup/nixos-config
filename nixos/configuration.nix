{
  inputs,
  pkgs,
  ...
}: {
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
        nerdfonts
        libnotify
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
        stylua
        typescript
        inputs.matugen.packages.${pkgs.system}.default
        udiskie
        yarn
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
