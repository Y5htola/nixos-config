{
    description = "NixOS Configuration";

    inputs = { 
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        
        #home manager
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

	    anyrun = {
	        url = "github:anyrun-org/anyrun";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        #Zen Browser
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, anyrun,... }: { 
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem { 
                system = "x86_64-linux";
                modules = [
                    ./modules/configuration.nix 

                    home-manager.nixosModules.home-manager { 
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.backupFileExtension = "home-manager.backup";

                        home-manager.extraSpecialArgs = { inherit inputs; }; 
                        home-manager.users.y5htola = import ./home/home.nix;
                    }   
                ];
            };
        };
    };
}
