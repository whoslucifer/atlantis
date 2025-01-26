{
  description = "Hansen's Nix Setup";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    hyprland = {
      url = "github:hyprwm/Hyprland?rev=d26439a0fe5594fb26d5a3c01571f9490a9a2d2c&submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      # inputs.nixpkgs.follows = "hyprland";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:lordhansen/zen-browser-flake";

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags";
    };
  };

  outputs = {
    nixpkgs,
    stylix,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        # allowBroken = true;
      };
    };

    inherit (import ./options.nix) username systemConfig userConfig;
  in {
    nixosConfigurations = {
      "nix" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit userConfig;
          inherit systemConfig;
        };

        modules = [
          ./global/configuration.nix
          ./global/hardware-configuration.nix

          stylix.nixosModules.stylix

          {
            nix.settings = {
              trusted-users = [username];
              warn-dirty = false;
            };
          }

          inputs.distro-grub-themes.nixosModules.${system}.default

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              # useGlobalPkgs = true;
              useUserPackages = true;
              users."${username}" = import ./home.nix;
              backupFileExtension = "backup";

              extraSpecialArgs = {
                inherit pkgs;
                inherit inputs;
                inherit username;
                inherit userConfig;
                inherit systemConfig;
              };
            };
          }
        ];
      };
    };
  };
}
