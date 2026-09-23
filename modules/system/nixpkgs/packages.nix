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
    uv
    vim
    git
    gdb
    lsd
    fzf
    bat
    ruff
    skhd
    lldb
    tree
    btop
    qpdf
    lavat
    cmake
    typst
    delta
    isort
    rsync
    gdown
    rclone
    nodejs
    pipenv
    rustup
    zoxide
    gradle
    ktlint
    ripgrep
    cmatrix
    libllvm
    pyright
    hunspell
    clang_22
    hercules
    nix-tree
    fastfetch
    nixfmt-rs
    shellcheck
    sketchybar
    hydra-check
    darwin.trash
    multimarkdown
    rust-analyzer
    temurin-bin-25
    protonmail-bridge
    coreutils-prefixed
    hunspellDicts.tr_TR
    hunspellDicts.en_US
    python314Packages.pytest
    lixPackageSets.git.nixpkgs-review

    ghostty-bin
    obsidian
    sioyek
    cinny-desktop
    zoom-us
    nicotine-plus

    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
    (pkgs.callPackage ../_derivations/z-library.nix { })
    (pkgs.callPackage ../_derivations/haveno-reto.nix { src = inputs.haveno-reto; })
    (pkgs.callPackage ../_derivations/bisq.nix { src = inputs.bisq; })
    (pkgs.callPackage ../_derivations/c3270.nix { src = inputs.suite3270; })
  ];
}
