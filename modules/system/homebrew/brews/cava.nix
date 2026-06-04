{ pkgs, ... }:

{
  homebrew = {
    brews = [
      {
        name = "cava";
        args = [ "HEAD" ];
      }
    ];
  };
}
