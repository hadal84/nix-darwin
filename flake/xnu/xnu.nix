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
	inputs.stylix.darwinModules.stylix

        (inputs.import-tree ../../modules/system)
        (inputs.import-tree ../../modules/hosts)
        
        (inputs.import-tree ../flake-modules)
      ];
    };
  };
}
