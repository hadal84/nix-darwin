[<img src="https://raw.githubusercontent.com/hadal84/nix-darwin/refs/heads/main/modules/home/userModules/packages/doom-emacs/doom.d/img/nixglass.png" width="200px" alt="logo" />](https://github.com/hadal84/nix-darwin)

# nix-euphoria

[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue?logo=nixos&logoColor=white)](https://nixos.org)
[![flake-parts](https://img.shields.io/badge/built%20with-flake--parts-7a4c9d)](https://github.com/hercules-ci/flake-parts)

my opinionated [nix-darwin](https://github.com/nix-darwin/nix-darwin) configuration that uses the dendritic module discovery pattern across nix-darwin and [home manager](https://github.com/nix-community/home-manager)

it should ideally not be run under a non-darwin host for the custom derivations included are built for macOS.

## features
- dendritic module discovery
- global [stylix](https://nix-community.github.io/stylix/) theming
- [home manager](https://github.com/nix-community/home-manager)
- [doom emacs unstraigtened](https://github.com/marienz/nix-doom-emacs-unstraightened)
- [omniWM](https://github.com/BarutSRB/OmniWM) with window animations
- [skhd](https://github.com/asmvik/skhd) keyboard daemon
- [sketchybar](https://github.com/felixkratz/sketchybar)
- [declerative alfred](https://www.alfredapp.com/)
- launchd services
- [homebrew](https://brew.sh/) with [nix-homebrew](https://github.com/zhaofengli/nix-homebrew)
- [agenix](https://github.com/ryantm/agenix) secret management
- custom derivations for 
  - c3270
  - nicotine
  - z-library
- flake based heretic builds for
  - [doom-emacs](https://github.com/marienz/nix-doom-emacs-unstraightened)
  - [spicetify](https://github.com/Gerg-L/spicetify-nix)
  - [zen-browser](https://github.com/0xc000022070/zen-browser-flake)
- 4-node custom proxy configured with clash-verge:
  - [hysteria2](https://v2.hysteria.network/)
  - [wireguard](https://www.wireguard.com/)
  - [xray REALITY](https://github.com/xtls/xray-core)
  - local [byeDPI](https://github.com/hufrea/byedpi)

## structure
the clash verge and ssh configurations are fully encrypted with agenix, anything else is available under home/ or system/config/

every single aspect of the system is declared in this file, from the launchd agents and browser extensions to the mainframe IBM z/ emulator, so expect the batshit insane source-tree thank you

```
.
├── flake
│   ├── flake-modules
│   │   ├── base.nix
│   │   ├── home-manager.nix
│   │   └── nix-homebrew.nix
│   └── xnu
│       └── xnu.nix
├── flake.lock
├── flake.nix
├── modules
│   ├── home
│   │   ├── hadal84.nix
│   │   └── userModules
│   │       ├── homePackages.nix
│   │       └── packages
│   │           ├── doom-emacs
│   │           │   ├── doom-emacs.nix
│   │           │   └── doom.d
│   │           │       ├── config
│   │           │       │   ├── mpremote.el
│   │           │       │   ├── nixfmt.el
│   │           │       │   ├── platformio.el
│   │           │       │   ├── treemacs.el
│   │           │       │   ├── typst.el
│   │           │       │   ├── ui.el
│   │           │       │   ├── variables.el
│   │           │       │   └── windowserver.el
│   │           │       ├── config.el
│   │           │       ├── img
│   │           │       │   ├── doom5.png
│   │           │       │   ├── doom6.png
│   │           │       │   ├── nixglass-bottom-padding.png
│   │           │       │   └── nixglass.png
│   │           │       ├── init.el
│   │           │       ├── packages.el
│   │           │       └── themes
│   │           │           └── kanagawa-theme.el
│   │           ├── spicetify
│   │           │   └── spicetify.nix
│   │           └── zen-browser
│   │               └── zen-browser.nix
│   ├── hosts
│   │   └── hadalXNU
│   │       ├── launchd
│   │       │   ├── envVariables.nix
│   │       │   └── services
│   │       │       ├── alfred.nix
│   │       │       ├── byedpi.nix
│   │       │       ├── ghostty.nix
│   │       │       ├── hydroxide.nix
│   │       │       ├── omniwm.nix
│   │       │       └── rclone.nix
│   │       ├── systemSettings.nix
│   │       └── WindowServer
│   │           └── dock.nix
│   └── system
│       ├── _derivations
│       │   ├── byedpi.nix
│       │   ├── c3270.nix
│       │   ├── nicotine.nix
│       │   └── z-library.nix
│       ├── config
│       │   ├── _wezterm
│       │   │   ├── wezterm.lua
│       │   │   └── wezterm.nix
│       │   ├── _yabai
│       │   │   ├── yabai.nix
│       │   │   └── yabairc
│       │   ├── alfred
│       │   │   ├── Alfred.alfredpreferences
│       │   │   │   ├── preferences
│       │   │   │   │   ├── appearance
│       │   │   │   │   │   └── options
│       │   │   │   │   │       └── prefs.plist
│       │   │   │   │   ├── features
│       │   │   │   │   │   └── defaultresults
│       │   │   │   │   │       └── prefs.plist
│       │   │   │   │   └── local
│       │   │   │   │       └── fbdf1f098aea252b5d7091aa569e94a9c28e3388
│       │   │   │   │           ├── appearance
│       │   │   │   │           │   ├── options
│       │   │   │   │           │   │   └── prefs.plist
│       │   │   │   │           │   └── prefs.plist
│       │   │   │   │           ├── features
│       │   │   │   │           │   └── clipboard
│       │   │   │   │           │       └── prefs.plist
│       │   │   │   │           └── hotkey
│       │   │   │   │               └── prefs.plist
│       │   │   │   ├── remote
│       │   │   │   │   ├── images
│       │   │   │   │   │   ├── items
│       │   │   │   │   │   └── pages
│       │   │   │   │   ├── local
│       │   │   │   │   └── pages
│       │   │   │   └── themes
│       │   │   │       └── theme.fileimport.50C22BC5-D7AF-4A2A-8AA1-25D43E2FD605
│       │   │   │           └── theme.json
│       │   │   └── alfred.nix
│       │   ├── bat
│       │   │   ├── bat.nix
│       │   │   └── config
│       │   ├── btop
│       │   │   └── btop.nix
│       │   ├── cava
│       │   │   ├── cava.nix
│       │   │   ├── config
│       │   │   ├── shaders
│       │   │   │   ├── bar_spectrum.frag
│       │   │   │   ├── eye_of_phi.frag
│       │   │   │   ├── northern_lights.frag
│       │   │   │   ├── orion_circle_rotate.frag
│       │   │   │   ├── orion_circle.frag
│       │   │   │   ├── orion_saturn_core.frag
│       │   │   │   ├── orion_saturn_subring.frag
│       │   │   │   ├── pass_through.vert
│       │   │   │   ├── solarized_dark
│       │   │   │   ├── spectrogram.frag
│       │   │   │   ├── tricolor
│       │   │   │   └── winamp_line_style_spectrum.frag
│       │   │   └── themes
│       │   │       ├── solarized_dark
│       │   │       └── tricolor
│       │   ├── fetch
│       │   │   ├── fetch.nix
│       │   │   └── images
│       │   │       ├── cyberia.png
│       │   │       ├── cybernix.png
│       │   │       ├── cybernixedgeless.png
│       │   │       ├── mac.txt
│       │   │       └── nixglass.png
│       │   ├── ghostty
│       │   │   ├── ghostty.nix
│       │   │   └── options.ghostty
│       │   ├── git
│       │   │   ├── git.nix
│       │   │   └── gitconfig
│       │   ├── obsidian
│       │   │   └── obsidian.nix
│       │   ├── omniwm
│       │   │   ├── omniwm.nix
│       │   │   └── settings.toml
│       │   ├── sketchybar
│       │   │   ├── plugins
│       │   │   │   ├── battery.sh
│       │   │   │   ├── clock.sh
│       │   │   │   ├── front_app.sh
│       │   │   │   ├── media.sh
│       │   │   │   ├── nixlogo.scpt
│       │   │   │   ├── omniwm.sh
│       │   │   │   ├── space.sh
│       │   │   │   └── volume.sh
│       │   │   ├── sketchybar.nix
│       │   │   └── sketchybarrc
│       │   ├── skhd
│       │   │   ├── skhd.nix
│       │   │   └── skhdrc
│       │   ├── ssh
│       │   │   └── ssh.nix
│       │   ├── vesktop
│       │   │   └── vesktop.nix
│       │   ├── vscodium
│       │   │   └── vscodium.nix
│       │   ├── zellij
│       │   │   ├── config.kdl
│       │   │   ├── layouts
│       │   │   │   └── default.kdl
│       │   │   ├── themes
│       │   │   │   └── Black_Metal.kdl
│       │   │   └── zellij.nix
│       │   └── zsh
│       │       ├── zsh.nix
│       │       └── zshrc
│       ├── homebrew
│       │   ├── brews
│       │   │   └── cava.nix
│       │   ├── casks
│       │   └── homebrew.nix
│       ├── nixpkgs
│       │   ├── fonts.nix
│       │   └── packages.nix
│       └── stylix
│           ├── base16
│           │   ├── black-metal
│           │   │   ├── black-metal-bathory.yaml
│           │   │   ├── black-metal-burzum.yaml
│           │   │   ├── black-metal-dark-funeral.yaml
│           │   │   ├── black-metal-gorgoroth.yaml
│           │   │   ├── black-metal-immortal.yaml
│           │   │   ├── black-metal-khold.yaml
│           │   │   ├── black-metal-marduk.yaml
│           │   │   ├── black-metal-mayhem.yaml
│           │   │   ├── black-metal-nile.yaml
│           │   │   ├── black-metal-venom.yaml
│           │   │   └── black-metal.yaml
│           │   ├── euphoria
│           │   │   ├── amoled.yaml
│           │   │   ├── maddy.yaml
│           │   │   └── rue.yaml
│           │   └── kanagawa
│           │       └── kanagawa.yaml
│           ├── base24
│           ├── config
│           │   └── stylix.nix
│           ├── fonts
│           │   ├── Dossier Nerd Font.ttc
│           │   └── ocr-a.ttf
│           └── wallpapers
│               ├── antagonist.webp
│               ├── bridget.jpeg
│               ├── carti.webp
│               ├── cdghair.jpeg
│               ├── defeat.jpeg
│               ├── ecstasy.png
│               ├── gothbridget.webp
│               ├── jules.jpg
│               └── lain.webp
├── README.md
├── scripts
│   ├── apple.sh
│   └── bootstrap.sh
└── secrets
    ├── clash-verge.age
    ├── github-ssh-key.age
    ├── hydroxide.age
    ├── phenoxide-ssh-key.age
    ├── rclone.age
    ├── secrets.nix
    └── ssh-config.age

83 directories, 146 files
```
