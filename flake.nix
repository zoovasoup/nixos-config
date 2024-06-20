{
  description = "zoovasoup nixos conifg";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hyprland.url = "github:hyprwm/Hyprland";
    #hyprland.url = "github:hyprwm/Hyprland?ref=v0.39.1";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hy3 = {
      # url = "github:outfoxxed/hy3?ref=hl0.40.0"; # where {version} is the hyprland release version
      url = "github:outfoxxed/hy3"; # development branch
      inputs.hyprland.follows = "hyprland";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

    ags.url = "github:Aylur/ags";

    matugen = {
      url = "github:/InioX/Matugen?ref=v2.2.0";
      # ref = "refs/tags/matugen-v2.2.0";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    inherit lib;
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {
      inherit inputs outputs;
      python3 = forAllSystems (system: nixpkgs.legacyPackages.${system}.python3);
      runtimeShell = forAllSystems (system: nixpkgs.legacyPackages.${system}.stdenv.shell);
      systemd = forAllSystems (system: nixpkgs.legacyPackages.${system}.systemd);
      fetchFromGithub = forAllSystems (system: nixpkgs.legacyPackages.${system}.fetchFromGithub);
      stdenv = forAllSystems (system: nixpkgs.legacyPackages.${system}.stdenv);
    };
    # {
    #       inherit inputs
    #     }
    nixosModules = import ./modules/nixos;

    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      # FIXME replace with your hostname
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "zvasoup@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}
