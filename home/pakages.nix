{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    lf
    neovim
    kitty
    rofi
    wofi
    firefox
    gnome-extension-manager
    gnome.gnome-tweaks
    gnome.dconf-editor
    dart-sass
    nodejs_21
    python3
    bun
    cargo
    rustup
    gcc
    cl
    zig
    unzip
    ripgrep
    fd
    tree-sitter
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
