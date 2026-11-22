{ pkgs, config, ... }:

{
  launchd.user.agents.nothing-bar = {
    command = "open -g -a '/Applications/NothingBar.app'";
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
