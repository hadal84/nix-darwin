{ pkgs, ... }:

{
  fonts.packages = [ 
     (pkgs.nerd-fonts.caskaydia-mono)
     ];
}
