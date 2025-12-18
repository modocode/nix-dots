{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
    in
			{
				# NixOS configuration entrypoint
				# Available through 'nixos-rebuild --flake .#your-hostname'
				nixosConfigurations = {
					# FIXME replace with your hostname
					nixos = nixpkgs.lib.nixosSystem {
						specialArgs = { inherit inputs; };
						# > Our main nixos configuration file <
						modules = [
							./nixos/configuration.nix 

							home-manager.nixosModules.home-manager
							{
# 2. Configure Home Manager settings
								home-manager.useGlobalPkgs = true;
								home-manager.useUserPackages = true;

# 3. Pass inputs to home-manager modules so you can use them there
								home-manager.extraSpecialArgs = { inherit inputs; };

# 4. Define your user directly here
								home-manager.users.monad = import ./home-manager/home.nix;
							}

						];
					};
				};


			};
}
