{
  pkgs,
  config,
  pkgs-stable,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [

    # python
    (python314.withPackages (
      ps: with ps; [
        ipykernel
        pip
      ]
    ))
    pyright
    pipenv
    python314Packages.pytest
    uv
    ruff
    isort

    # nix
    nix-tree
    nixfmt-rs
    hydra-check
    lixPackageSets.git.nixpkgs-review

    # debuggers and toolchains
    gdb
    lldb
    cmake
    gnumake
    libllvm
    clang_22

    # spelling dictionaries
    hunspellDicts.tr_TR
    hunspellDicts.en_US
    hunspell

    # cli
    coreutils-prefixed
    darwin.trash
    fastfetch
    linecast
    ripgrep
    cmatrix
    zoxide
    lavat
    gdown
    tree
    btop
    bat
    lsd
    fzf
    vim
    fd

    # json
    jq

    # version control
    delta
    git
    got

    # daemons
    skhd
    rsync
    rclone
    sketchybar
    protonmail-bridge

    # pdf
    qpdf

    # typst
    typst

    # swift
    swift

    # node
    nodejs

    # rust
    rust-analyzer
    rustup

    # java && kotlin
    temurin-bin-25
    gradle
    ktlint

    # z/OS
    hercules

    # shell
    shellcheck

    # md
    multimarkdown

    # Let's all love LEAN
    lean4

    # apps
    ghostty-bin
    obsidian
    sioyek
    cinny-desktop
    zoom-us
    nicotine-plus

    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.terrascope.packages.${pkgs.stdenv.hostPlatform.system}.default
    (pkgs.callPackage ../_derivations/z-library.nix { })
    (pkgs.callPackage ../_derivations/haveno-reto.nix { src = inputs.haveno-reto; })
    (pkgs.callPackage ../_derivations/bisq.nix { src = inputs.bisq; })
    (pkgs.callPackage ../_derivations/c3270.nix { src = inputs.suite3270; })
  ];
}
