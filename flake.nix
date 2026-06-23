{
  description = "My NixOS Flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    homemanager.url = "github:nix-community/home-manager/master";
    zenbrowser.url = "github:youwen5/zen-browser-flake";
    apple-emoji.url = "github:oxcl/nix-flake-apple-emoji";
    nvchad.url = "github:nix-community/nix4nvchad";
    astal.url = "github:aylur/astal";
    ags.url = "github:Aylur/ags";
  };

  outputs = { nixpkgs, homemanager, zenbrowser, apple-emoji, nvchad, astal, ags, ... }:
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
              inherit astal;
              inherit ags;
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
