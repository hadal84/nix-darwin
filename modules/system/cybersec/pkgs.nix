{
  pkgs,
  config,
  inputs,
  nixpkgs,
  ...
}:

{
  homebrew = {
    casks = [
      "tor-browser"
      "clash-verge-rev"
      "burp-suite"
    ];

    brews = [
      "hydra"
    ];

    masApps = {
      "WireGuard" = 1451685025;
    };
  };

  environment.systemPackages = with pkgs; [
    metasploit
    wireshark
    john
    sherlock
    holehe
    hashcat
    ghidra
    nmap
    tor
    sqlmap
    openvpn
    subfinder
    radare2
    gdb
    byedpi
    wafw00f
  ];
}
