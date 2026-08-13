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
    pyright
    hunspell
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
    protonmail-bridge
    coreutils-prefixed
    hunspellDicts.tr_TR
    hunspellDicts.en_US
    python314Packages.pytest
    lixPackageSets.git.nixpkgs-review

    ghostty-bin
    obsidian
    vscodium
    sioyek
    cinny-desktop
    zoom-us

    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
    (import ../_derivations/nicotine.nix { inherit stdenvNoCC; })
    (pkgs.callPackage ../_derivations/z-library.nix { })
    (pkgs.callPackage ../_derivations/haveno-reto.nix { src = inputs.haveno-reto; })
    (pkgs.callPackage ../_derivations/bisq2.nix { src = inputs.bisq2; })
    (pkgs.callPackage ../_derivations/c3270.nix { src = inputs.suite3270; })
  ];
}
