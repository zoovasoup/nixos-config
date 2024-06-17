{...}: {
  imports = [
    ./nix.nix
    ./tlp.nix
    ./sound.nix
    ./locale.nix
    ./nix-ld.nix
    ./amd-driver.nix
    ./bootloader.nix
    ./networking.nix
  ];
}
