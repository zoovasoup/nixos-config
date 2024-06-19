{
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
      # Script to add Flatpak remotes and install apps
      myApps = with pkgs; [
        # Fonts
        nerdfonts

        # Themes
        # gruvbox-gtk-theme

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
      packages = myApps;
    };
  };

  services.flatpak = {
    packages = [
      "one.ablaze.floorp"
      "org.learningequality.Kolibri"
    ];
  };

  # modules.battery-check.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
