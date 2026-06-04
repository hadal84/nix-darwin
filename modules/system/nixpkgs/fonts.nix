{ pkgs, ... }:

{
  fonts.packages = [ 
     (pkgs.nerd-fonts.caskaydia-mono)
     (pkgs.nerd-fonts.symbols-only)
     (pkgs.symbola)
     ];
}
