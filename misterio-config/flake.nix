{
  description = "Your new nix config";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
        url = "github:nix-community/nixvim/nixos-23.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    #hyprland.url = "github:hyprwm/Hyprland";
    hyprland.url = "github:hyprwm/Hyprland?ref=v0.38.0";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    
    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.38.0"; # where {version} is the hyprland release version
      inputs.hyprland.follows = "hyprland";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    matugen = {
      url = "github:/InioX/Matugen?ref=v2.2.0";
      # ref = "refs/tags/matugen-v2.2.0";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland, 
    hy3,
    matugen,
    ...
  } @ inputs: let
    inherit (self) outputs;
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
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      # FIXME replace with your hostname
      zvasoup = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "zvasoup" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}
