{ pkgs }:

pkgs.byedpi.overrideAttrs (old: {
  meta = (old.meta or {}) // {
    platforms = pkgs.lib.platforms.all;
    broken = false;
  };
})
