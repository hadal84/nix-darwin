{ pkgs, config, ... }:

{
  launchd.user.agents.protonmail-bridge = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.protonmail-bridge}/bin/protonmail-bridge"
        "--noninteractive"
      ];
      KeepAlive = true;
      RunAtLoad = true;
      LimitLoadToSessionType = "Aqua";
      StandardOutPath = "/tmp/proton-bridge.log";
      StandardErrorPath = "/tmp/proton-bridge.err";
    };
  };
}
