{
  description = "Hansen's Nix Setup";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };   

    stylix.url = "github:danth/stylix";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      # inputs.nixpkgs.follows = "hyprland";
    };
    
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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
      inputs.nixpkgs.follows = "nixpkgs-stable";
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
    /*nixos-hardware,*/
    stylix,
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

    pkgs-stable = import nixpkgs-stable {
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
	
          #nixos-hardware.nixosModules.lenovo-thinkpad-t460s
          inputs.distro-grub-themes.nixosModules.${system}.default

          nix-index-database.nixosModules.nix-index
          # optional to also wrap and install comma
          # { programs.nix-index-database.comma.enable = true; }

          ngrok.nixosModules.ngrok

          # Make pkgs-stable available as a special argument for modules
          {
            _module.args.pkgs-stable = pkgs-stable;
          }

        ];
      };
    };

    homeConfigurations = {
      "${username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs-stable;
        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          ./home.nix

          stylix.homeManagerModules.stylix
        ];
      };
    };
  };
}
