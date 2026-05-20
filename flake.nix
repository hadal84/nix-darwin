{
  description = "cyberia-mono";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-emacs-plus = {
    url = "github:d12frosted/homebrew-emacs-plus";
    flake = false;
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, homebrew-core, homebrew-cask, ...}:
  let
    configuration = { pkgs, ... }: {
      nix.settings.experimental-features = "nix-command flakes";

      # set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # used for backwards compatibility 
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      system.primaryUser = "hadal84";

      # aarch64 darwin
      nixpkgs.hostPlatform = "aarch64-darwin";

      nixpkgs.config.allowUnfree = true;

      users.users.hadal84 = {
        name = "hadal84";
        home = /Users/hadal84;
      };
    };
  in
  {
    # $ darwin-rebuild build --flake .#xnu
    darwinConfigurations."xnu" = nix-darwin.lib.darwinSystem {
      specialArgs = { 
        inherit inputs;
        selfPath = "/Users/hadal84/nix-darwin"; 
      };
      modules = [ 
      home-manager.darwinModules.home-manager {
       home-manager.useGlobalPkgs = true;
       home-manager.useUserPackages = true;
       home-manager.users.hadal84 = import ./home/hadal84.nix;
      }
      configuration
      ./modules/system/packages.nix 
      ./hosts/hadalXNU/systemSettings.nix 
      nix-homebrew.darwinModules.nix-homebrew {
	nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "hadal84";
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "d12frosted/homebrew-emacs-plus" = inputs.homebrew-emacs-plus;
            };
            mutableTaps = false; # use flake for repos
          };
        }
       ({config, ...}: {
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
        })
      ];
    };
  };
}
