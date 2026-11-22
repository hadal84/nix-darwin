{ pkgs, config, ... }:

{
  launchd.user.agents.claude = {
    command = "open -g -a '/Applications/Claude.app'";
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
