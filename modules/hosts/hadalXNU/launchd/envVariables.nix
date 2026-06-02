{ pkgs, config, ... }:

{
  launchd.user.envVariables = {
    DOOMLOCALDIR = "/Users/hadal84/.local/share/doom";
  };
}
