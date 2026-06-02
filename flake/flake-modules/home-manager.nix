{ inputs, pkgs, ... }:

{
    home-manager = {
    extraSpecialArgs = { 
      inherit inputs pkgs; 
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.hadal84 = import ../../modules/home/hadal84.nix;
  };
}
