let
  hadal84 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK+xVdWLPPjRgfo+rjODK+X79HvV8evoYMSENxmFd+i6 hadal84@proton.me";
  xnu = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP61jM1vXhi1SgAOcskPsT5nQWPy7KTF2haZNfeBcDIi";
  
  systems = [ xnu ];
  users = [ hadal84 ];
in
{
  "github-ssh-key.age".publicKeys = users ++ systems;
  "phenoxide-ssh-key.age".publicKeys = users ++ systems;
  "rclone.age".publicKeys = users ++ systems;
  "ssh-config.age".publicKeys = users ++ systems;
  "clash-verge.age".publicKeys = users ++ systems;
  "clash-verge-tor.age".publicKeys = users ++ systems;
  "zowe.age".publicKeys = users ++ systems;
}
