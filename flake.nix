{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # plasma-manager = {
    #   url = "github:nix-community/plasma-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
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
            # inputs.plasma-manager.homeModules.plasma-manager

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

      devShells.${system}.default = pkgs.mkShell {
        name = "my-nix-config-shell";

        packages = with pkgs; [
          nixd
          nixfmt-rfc-style
          just
        ];

        shellHook = ''
          						echo "Environment prepared for NixOS configuration!"
          	          echo "LSP: nixd | Formatter: nixfmt"
          	          exec ${pkgs.zsh}/bin/zsh

          					'';
      };

    };
}
