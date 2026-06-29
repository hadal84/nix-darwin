{ inputs, pkgs, config, lib, ... }:

# adding any unnecessary overlay is forbidden. keep every overlay minimal. declare none unless a vulnerability, that hasn't been patched upstream yet, is found.

{
  nixpkgs.overlays = [
    
  ]; 
}
