{
  description = "Hansen's Nix Setup";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      # inputs.nixpkgs.follows = "hyprland";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser.url = "github:whoslucifer/zen-browser-flake";    

    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    ngrok.url = "github:ngrok/ngrok-nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    ags = {
      url = "github:whoslucifer/ags?rev=05e0f23534fa30c1db2a142664ee8f71e38db260";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen = {
      url = "github:/InioX/Matugen";
      # ref = "refs/tags/matugen-v0.10.0"
    };

    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };

  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nix-index-database,
    ngrok,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    host = "nix";
    username = "asherah";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    homePkgs = import nixpkgs-stable {
      inherit system;
      config = {
	      allowUnfree = true;
      };
    };

  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem rec {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit host;
        };

        modules = [
          ./hosts/nix/config.nix

          inputs.distro-grub-themes.nixosModules.${system}.default

          nix-index-database.nixosModules.nix-index
          # optional to also wrap and install comma
          # { programs.nix-index-database.comma.enable = true; }

          ngrok.nixosModules.ngrok
        ];
      };
    };

    homeConfigurations = {
      "${username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = homePkgs;
        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          ./home.nix
        ];
      };
    };
  };
}
