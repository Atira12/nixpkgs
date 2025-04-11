{
  description = "Home Manager Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, home-manager, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnsupportedSystem = true;
          allowUnfree = true;
          allowBroken = true;
        };
      };
    in {
      homeConfigurations.wamu = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./modules/alacritty.nix
          ./modules/neovim.nix
          ./modules/packages.nix
          ./modules/directory.nix
          ./modules/firefox.nix
          ./home.nix
        ];
      };

      wamu = self.homeConfigurations.wamu.activationPackage;
      defaultPackage.${system} = self.wamu;
    };
}
