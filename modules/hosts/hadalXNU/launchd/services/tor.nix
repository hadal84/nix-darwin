{ pkgs, inputs, ... }:

{
  launchd.user.agents.tor = {
    serviceConfig = {
      ProgramArguments = [ 
        "${pkgs.tor}/bin/tor" 
        "--SocksPort" "127.0.0.1:9050" 
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardErrorPath = "/tmp/tor.err.log";
      StandardOutPath = "/tmp/tor.out.log";
    };
  };
}
