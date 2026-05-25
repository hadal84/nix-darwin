{
  description = "cyberia-mono";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";

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

    homebrew-barutsrb = {
    url = "github:barutSRB/homebrew-tap";
    flake = false;
    };
  };

  outputs = inputs@{ flake-parts, ... }:

  flake-parts.lib.mkFlake { inherit inputs; } {
     systems = [ "aarch64-darwin" ];

     imports = [
       (inputs.import-tree ./modules/flake)
     ];
  };

}
