{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nix-ld
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
    ];
  };
}
