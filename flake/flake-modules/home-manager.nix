{ inputs, pkgs, selfPath, ... }:

{
    home-manager = {
      extraSpecialArgs = { 
        inherit inputs pkgs; 
        inherit selfPath;
      };
      useGlobalPkgs = true;
      useUserPackages = true;
      users.hadal84 = import ../../modules/home/hadal84.nix;
    };
}
