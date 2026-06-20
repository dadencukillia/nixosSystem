{
  description = "My NixOS Flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    homemanager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zenbrowser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, homemanager, zenbrowser, ... }@inputs:
  let
    dotOpts = import ./options.nix;
  in {
    nixosConfigurations = {
      linuxSystem = nixpkgs.lib.nixosSystem {
        system = dotOpts.system;
	
	modules = [
	  ./hardware-configuration.nix
	  ./configuration.nix

	  homemanager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.extraSpecialArgs = {
	      inherit zenbrowser;
	      username = dotOpts.username;
	    };

	    home-manager.users = {
	      ${dotOpts.username} = import ./dot/home.nix;
	    };
	  }
        ];
      };
    };
  };
}
