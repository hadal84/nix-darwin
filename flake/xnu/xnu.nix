{ inputs, ... }:

let
  system = "aarch64-darwin";

  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [ inputs.nur.overlays.default ];
  };

  pkgs-stable = import inputs.nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };

in

{
  flake = {
    darwinConfigurations."xnu" = inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit inputs;
        selfPath = "/Users/hadal84/nix-darwin";
      };
      
      modules = [
        { nixpkgs.pkgs = pkgs; }

        inputs.agenix.darwinModules.default
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-homebrew.darwinModules.nix-homebrew

        (inputs.import-tree ../../modules/system)
        (inputs.import-tree ../../modules/hosts)
        
        ../flake-modules/base.nix
        ../flake-modules/home-manager.nix
        ../flake-modules/nix-homebrew.nix
      ];
    };
  };
}
