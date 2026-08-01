{ src, lib, stdenvNoCC }:

stdenvNoCC.mkDerivation rec {
  pname = "haveno-reto";
  version = "latest";

  inherit src;

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    MOUNT_DIR=$(/usr/bin/hdiutil attach -nobrowse -readonly "$src" | grep -o '/Volumes/.*' | head -n 1)
    
    if [ -z "$MOUNT_DIR" ]; then
      echo "Error: Failed to mount disk image."
      exit 1
    fi

    mkdir -p "$out/Applications"
    
    cp -R "$MOUNT_DIR"/*.app "$out/Applications/"
    
    /usr/bin/hdiutil detach "$MOUNT_DIR"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Retoswap Desktop Application";
    homepage = "https://retoswap.com/";
    platforms = platforms.darwin;
  };
}
