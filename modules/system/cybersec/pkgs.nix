{
  pkgs,
  config,
  inputs,
  nixpkgs,
  ...
}:

let

  master-branch = inputs.nixpkgs-master.legacyPackages.${pkgs.stdenv.hostPlatform.system};

in

{
  homebrew = {
    casks = [
      "tor-browser"
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
    openvpn
    radare2
    gdb
    master-branch.byedpi
  ];
}
