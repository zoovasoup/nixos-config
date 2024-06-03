# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
{
  battery_monitor = import ./battery_monitor.nix;
  battery-check = import ./battery-check.nix;
}
