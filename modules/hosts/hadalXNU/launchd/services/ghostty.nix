{ pkgs, config, ... }:

{
  launchd.user.agents.ghostty = {
    command = "open -g -a '/Applications/Nix Apps/Ghostty.app'";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = false;
      ProcessType = "Interactive";
      AbandonProcessGroup = true;
      StandardOutPath = "/tmp/ghostty.out.log";
      StandardErrorPath = "/tmp/ghostty.err.log";
    };
  };
}
