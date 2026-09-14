{ pkgs, config, ... }:

{
  launchd.user.agents.omniwm = {
    command = "open -g -a '/Applications/Nix Apps/OmniWM.app'";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = false;
      ProcessType = "Interactive";
      AbandonProcessGroup = true;
      StandardOutPath = "/tmp/omni.out.log";
      StandardErrorPath = "/tmp/omni.err.log";
    };
  };
}
