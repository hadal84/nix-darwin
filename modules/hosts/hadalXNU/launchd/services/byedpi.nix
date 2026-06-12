{ pkgs, ... }:
let
  byedpi = import ../../../../system/_derivations/byedpi.nix { inherit pkgs; };
in
{
  launchd.user.agents.byedpi = {
    serviceConfig = {
      ProgramArguments = [ 
        "${byedpi}/bin/ciadpi" 
        "-i" "127.0.0.1" 
        "-p" "1080" 
        "-r" "1+s"
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardErrorPath = "/tmp/byedpi.err.log";
      StandardOutPath = "/tmp/byedpi.out.log";
    };
  };
}
