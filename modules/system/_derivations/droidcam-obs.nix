{ config, pkgs, inputs, ... }:

# okay ngl this entire derivation is vibecoded but it's not my fault .pkg files are so fucking hard to unpack and install with bash

let
  droidcam-obs-plugin = pkgs.stdenv.mkDerivation {
    pname = "droidcam-obs";
    version = "2.5.1";
    
    src = inputs.droidcam-pkg; 

    nativeBuildInputs = with pkgs; [ xar cpio gzip ];

    unpackPhase = ''
      xar -xf $src
      
      PAYLOAD=$(find . -name "Payload" | head -n 1)
      zcat "$PAYLOAD" | cpio -idm
    '';

    installPhase = ''
      mkdir -p $out
      
      PLUGIN_SRC=$(find . -type d -name "*.plugin" | head -n 1)
      
      if [ -z "$PLUGIN_SRC" ]; then
        echo "Error: Could not find .plugin bundle in payload."
        find . 
        exit 1
      fi
      
      cp -R "$PLUGIN_SRC" $out/droidcamobs.plugin
    '';
  };
in
{
  home-manager.users.hadal84 = { lib, ... }: {
    home.activation.installDroidCam = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Installing DroidCam OBS Plugin via Home Manager..."
      PLUGIN_DIR="$HOME/Library/Application Support/obs-studio/plugins"
      
      mkdir -p "$PLUGIN_DIR"
      
      # nuke the target so we get a clean copy, and clean up the old broken folder name
      rm -rf "$PLUGIN_DIR/droidcamobs.plugin"
      rm -rf "$PLUGIN_DIR/droidcam-obs"
      
      # copy the actual .plugin bundle over to your local library
      cp -R "${droidcam-obs-plugin}/droidcamobs.plugin" "$PLUGIN_DIR/droidcamobs.plugin"
      
      chmod -R u+w "$PLUGIN_DIR/droidcamobs.plugin"
      xattr -rd com.apple.quarantine "$PLUGIN_DIR/droidcamobs.plugin" 2>/dev/null || true
    '';
  };
}
