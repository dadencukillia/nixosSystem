{
	description = "My NixOS Flake configuration";
	
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, ...}@inputs: {
		nixosConfigurations = {
			linuxSystem = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hardware-configuration.nix
					./configuration.nix
				];
			};
		};
	};
}
