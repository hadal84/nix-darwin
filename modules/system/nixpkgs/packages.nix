{
  pkgs,
  config,
  pkgs-stable,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    jq
    fd
    vim
    git
    lsd
    fzf
    bat
    skhd
    tree
    btop
    lavat
    cmake
    delta
    isort
    rsync
    rclone
    nodejs
    pipenv
    rustup
    zoxide
    ktlint
    nodejs
    ripgrep
    hercules
    fastfetch
    nixfmt-rs
    hydroxide
    shellcheck
    sketchybar
    darwin.trash
    multimarkdown
    rust-analyzer
    coreutils-prefixed
    python314Packages.pytest

    ghostty-bin
    vesktop
    obsidian
    vscodium
    sioyek
    cinny-desktop
    zoom-us

    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    (import ../_derivations/nicotine.nix { inherit stdenvNoCC; })
    (import ../_derivations/byedpi.nix { inherit pkgs; })
    (pkgs.callPackage ../_derivations/z-library.nix { })
    (pkgs.callPackage ../_derivations/c3270.nix { suite3270-src = inputs.suite3270-src; })
  ];
}
