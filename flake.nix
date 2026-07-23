{
  description = "cyberia-mono";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    nur.url = "github:nix-community/NUR";
    agenix.url = "github:ryantm/agenix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    herdr.url="github:ogulcancelik/herdr";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    brew-src = {
      url = "github:homebrew/brew";
      flake = false;
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
      inputs.brew-src.follows = "brew-src";
    };

    homebrew-barutsrb = {
      url = "github:barutSRB/homebrew-tap";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    frc-nix = {
      url = "github:frc4451/frc-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ohitstom-spicetify-extensions = {
      url = "github:ohitstom/spicetify-extensions/main";
      flake = false;
    };

    pithaya-spicetify-better-local-files = {
      url = "github:Pithaya/spicetify-apps-dist?ref=dist/better-local-files";
      flake = false;
    };

    pithaya-spicetify-eternal-jukebox = {
      url = "github:Pithaya/spicetify-apps-dist?ref=dist/eternal-jukebox";
      flake = false;
    };

    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    suite3270-src = {
      url = "https://sourceforge.net/projects/x3270/files/x3270/4.3ga10/suite3270-4.3ga10-src.tgz";
      flake = false;
    };

    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prism-oreui = {
      url = "github:ninsent/Ore-UI-theme-pack";
      flake = false;
    };

  };

  outputs =
    inputs@{ flake-parts, ... }:

    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" ];

      imports = [
        (inputs.import-tree ./flake/xnu)
      ];
    };

}
