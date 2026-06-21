{
  description = "My NixOS Flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    homemanager.url = "github:nix-community/home-manager/master";
    zenbrowser.url = "github:youwen5/zen-browser-flake";
    apple-emoji.url = "github:oxcl/nix-flake-apple-emoji";
    nvchad.url = "github:nix-community/nix4nvchad";
  };

  outputs = { nixpkgs, homemanager, zenbrowser, apple-emoji, nvchad, ... }@inputs:
  let
    dotOpts = import ./options.nix;
  in {
    nixosConfigurations = {
      linuxSystem = nixpkgs.lib.nixosSystem {
        system = dotOpts.system;

        modules = [
          ./hardware-configuration.nix
          ./configuration.nix
          {
            nixpkgs.overlays = [ apple-emoji.overlays.default ];
          }
          homemanager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              zenbrowser = zenbrowser.packages.${dotOpts.system}.default;
              inherit (dotOpts) username;
              inherit apple-emoji;
              inherit nvchad;
            };

            home-manager.users = {
              ${dotOpts.username} = import ./dot/home.nix;
                    root = import ./root-home-manager.nix;
            };
          }
        ];
      };
    };
  };
}
