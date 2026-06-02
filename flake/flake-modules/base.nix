{ inputs, pkgs, ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 6;
  system.primaryUser = "hadal84";
  
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.overlays = [ inputs.nur.overlays.default ];

  users.users.hadal84 = {
    name = "hadal84";
    home = "/Users/hadal84";
  };
}
