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
    ruff
    skhd
    tree
    btop
    qpdf
    lavat
    cmake
    typst
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
    pyright
    hunspell
    hercules
    fastfetch
    nixfmt-rs
    hydroxide
    shellcheck
    sketchybar
    hydra-check
    darwin.trash
    multimarkdown
    rust-analyzer
    coreutils-prefixed
    hunspellDicts.tr_TR
    hunspellDicts.en_US
    python314Packages.pytest
    lixPackageSets.git.nixpkgs-review

    ghostty-bin
    vesktop
    obsidian
    vscodium
    sioyek
    cinny-desktop
    zoom-us

    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
    (import ../_derivations/nicotine.nix { inherit stdenvNoCC; })
    (pkgs.callPackage ../_derivations/z-library.nix { })
    (pkgs.callPackage ../_derivations/c3270.nix { suite3270-src = inputs.suite3270-src; })
  ];
}
