{ pkgs, config, ... }:

{
  launchd.user.agents.alfred = {
    command = "open '/Applications/Alfred 5.app'";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = false;
      ProcessType = "Interactive";
      AbandonProcessGroup = true;
      StandardOutPath = "/tmp/alfred.out.log";
      StandardErrorPath = "/tmp/alfred.err.log";
    };
  };
}
