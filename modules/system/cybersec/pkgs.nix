{
  pkgs,
  config,
  inputs,
  ...
}:

{
  homebrew = {
    casks = [
      "clash-verge-rev"
      "burp-suite"
    ];

    brews = [
    ];

    masApps = {
      "WireGuard" = 1451685025;
    };
  };

  environment.systemPackages = with pkgs; [
    metasploit
    wireshark
    john
    hashcat
    ghidra
    nmap
    sqlmap
  ];
}
