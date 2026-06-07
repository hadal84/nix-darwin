{ pkgs, inputs, lib, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;

    /*
    theme = {
      name = "Blackout";
      src = "${pkgs.fetchFromGitHub {
        owner = "spicetify";
        repo = "spicetify-themes";
        rev = "master"; 
        hash = "sha256-z8A7anB5l7SwHA5OEuM+Gi9uI0gwTd0/PXBZb7TL3tI=";
      }}/Blackout";
      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;
    };
    */


    enabledExtensions = with spicePkgs.extensions; [
    /*
     ({
        name = "spicy-lyrics.mjs";
        src = "${pkgs.fetchFromGitHub {
          owner = "Spikerko";
          repo = "spicy-lyrics";
          rev = "v1.0.0"; 
          hash = "sha256-Bq+he9pdFWfzSGn050IpYWrf5pRtmd1cfPPqzbCoqa0="; 
        }}/builds";
      })
    */
      spicyLyrics
      ({
        name = "noControls.js";
        src = "${pkgs.fetchFromGitHub {
          owner = "ohitstom";
          repo = "spicetify-extensions";
          rev = "main";
          hash = "sha256-jjx35PBp47JGc7WS/h2M7r1Mv7cNmWM0zBGVDYSgFvs=";
        }}/noControls";
      })
    ];

   enabledCustomApps = [
      ({
        name = "better-local-files";
        src = pkgs.fetchFromGitHub {
          owner = "Pithaya";
          repo = "spicetify-apps-dist";
          rev = "dist/better-local-files";
          hash = "sha256-S+rp4naiV87v62wQPX9albyofWvKKbIPx8rrLAk2ffI="; 
        };
      })
    ]; 

    enabledSnippets = [
      "${pkgs.writeText "rounded-now-playing-bar.css" ''
        :root{ --border-radius-1: 8px; }
        .Root__now-playing-bar, .Root__now-playing-bar footer {
          border-radius: var(--border-radius-1) !important;
        }
      ''}"

      "${pkgs.writeText "remove-gradient.css" ''
        .main-entityHeader-background, 
        .main-entityHeader-background.main-entityHeader-overlay, 
        .main-entityHeader-backgroundColor {
          background-color: transparent !important;
          background-image: none !important;
        }

        .main-actionBarBackground-background,
        .playlist-playlist-actionBarBackground-background {
          background-color: transparent !important;
          background-image: none !important;
        }

        .main-home-homeHeader {
          background-color: transparent !important;
          background-image: none !important;
        }
      ''}" 
    ];
  };

  home.activation.disableSpotifyUpdates = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  SPOTIFY_UPDATE_DIR="$HOME/Library/Application Support/Spotify/PersistentCache/Update"

  if ! /usr/bin/stat -f "%Sf" "$SPOTIFY_UPDATE_DIR" 2> /dev/null | grep -q uchg; then
    rm -rf "$SPOTIFY_UPDATE_DIR"
    mkdir -p "$SPOTIFY_UPDATE_DIR"
    /usr/bin/chflags uchg "$SPOTIFY_UPDATE_DIR"
  fi
  ''; 

  stylix.targets.spicetify.enable=true;
}
