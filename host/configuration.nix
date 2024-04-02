# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # ./main-user.nix
    inputs.home-manager.nixosModules.default
    ./../system/hardware/bootloader.nix
    ./../system/hardware/location-and-time.nix
    ./../system/hardware/audio.nix
    ./../system/hardware/keyboard.nix
    ./../system/hardware/network.nix
    ./../system/hardware/user.nix
  ];

  # main-user.enable = true;
  # main-user.userName = "zvasoup";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "zvasoup" = import ./home.nix; };
  };

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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # programs.hyprland = {
  # Install the packages from nixpkgs
  #   enable = true;
  # Whether to enable XWayland
  #   xwayland.enable = true;
  # };

  # programs.git = {
  # enable = true;
  # userName = "zvasoup";
  # userEmail = "zulfa.plank@proton.me"; 
  # config = {
  # init = { 
  # defaultBranch = "main";
  # };
  # };
  # };

  # environment.etc."gitconfig".text = ''
  #   [user]
  #     name = zvasoup
  #     email = zulfa.plank@proton.me
  #   [url "git@github.com:"]
  #     insteadOf = https://github.com/
  # '';

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # extraPortals = [
    #   pkgs.xdg-desktop-portal
    #   pkgs.xdg-desktop-portal-gtk
    # ];
  };

}

