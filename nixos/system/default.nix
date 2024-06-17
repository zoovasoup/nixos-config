{...}: {
  imports = [
    ./nix.nix
    ./power-management.nix
    ./sound.nix
    ./locale.nix
    ./nix-ld.nix
    ./amd-driver.nix
    ./bootloader.nix
    ./networking.nix
    ./nixpkgs.nix
  ];
}
