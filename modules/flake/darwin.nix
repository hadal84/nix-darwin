{ inputs, ... }:

let
  configuration = { pkgs, ... }: {
    nix.settings.experimental-features = "nix-command flakes";

    system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    system.stateVersion = 6;
    system.primaryUser = "hadal84";
    nixpkgs.hostPlatform = "aarch64-darwin";
    nixpkgs.config.allowUnfree = true;

    users.users.hadal84 = {
      name = "hadal84";
      home = /Users/hadal84;
    };
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
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Path adjusted relative to modules/flake/darwin.nix
          home-manager.users.hadal84 = import ../../home/hadal84.nix;
        }
        configuration
        
        ../../modules/system/packages.nix 
        ../../hosts/hadalXNU/systemSettings.nix 
        
        inputs.nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "hadal84";
            taps = {
              "homebrew/homebrew-core" = inputs.homebrew-core;
              "homebrew/homebrew-cask" = inputs.homebrew-cask;
              "d12frosted/homebrew-emacs-plus" = inputs.homebrew-emacs-plus;
              "barutsrb/homebrew-tap" = inputs.homebrew-barutsrb;
            };
            mutableTaps = false; 
          };
        }
        ({ config, ... }: {
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
        })
      ];
    };
  };
}
