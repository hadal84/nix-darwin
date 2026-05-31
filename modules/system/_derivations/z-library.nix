{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "z-library";
  version = "latest";

  src = fetchurl {
    url = "https://dln1.ncdn.ec/general-files/soft/desktop/zlibrary-setup-latest.dmg";
    sha256 = "10bhvyxr5577h40ahb95r2qwl5zrlg80s5nsba321bl34fhfl9pl"; 
  };

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
    description = "Z-Library Desktop Application";
    homepage = "https://z-lib.gs/";
    platforms = platforms.darwin;
  };
}
