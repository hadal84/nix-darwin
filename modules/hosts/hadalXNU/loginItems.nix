{ pkgs, config, ... }:

{

  launchd.user.agents.omniwm = {
    command = "/Applications/omniwm.app/Contents/MacOS/omniwm";
    
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true; 
      ProcessType = "Interactive"; 
      StandardOutPath = "/tmp/omniwm.out.log";
      StandardErrorPath = "/tmp/omniwm.err.log";
    };
  };

  launchd.user.agents.ghostty = {
    command = "/Applications/Nix Apps/Ghostty.app";
    
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true; 
      ProcessType = "Interactive"; 
      StandardOutPath = "/tmp/ghostty.out.log";
      StandardErrorPath = "/tmp/ghostty.err.log";
    };
  };
}
