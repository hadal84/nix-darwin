{ pkgs, config, inputs, ... }:

{
  launchd.user.agents.emacs-daemon = {
    command = "open -j -a '/Users/hadal84/Applications/Home Manager Apps/Emacs.app'";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = false;
      ProcessType = "Interactive";
      AbandonProcessGroup = true;
    };
  };
}
