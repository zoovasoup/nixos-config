# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  my-module = import [
    ./hardware/audio.nix
    ./hardware/keyboard.nix
    ./hardware/bootloader.nix
    ./hardware/location-and-time.nix
    ./wm/xserver.nix
    ./cups-print.nix
    ./pakages.nix
  ];

}
