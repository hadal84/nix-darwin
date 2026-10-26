{ pkgs, inputs, ... }:

let 

playcover = pkgs.stdenvNoCC.mkDerivation rec {
  pname = "playcover";
  version = "4.0";
  src = inputs.playcover;

  nativeBuildInputs = [ pkgs._7zz ];

  sourceRoot = ".";

  unpackPhase = ''
    runHook preUnpack
    
    7zz x "$src"
    
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/Applications"
    cp -R *.app "$out/Applications/"
  '';

  meta = with pkgs.lib; {
    description = "PlayCover Pre-release Desktop Application";
    homepage = "https://playcover.io/";
    platforms = platforms.darwin;
  };
};

in

{
  system.activationScripts.postActivation.text = ''
    echo "Deploying PlayCover to /Applications..."
    
    rm -rf /Applications/PlayCover.app
    
    cp -R ${playcover}/Applications/PlayCover.app /Applications/
    
    chflags -R nouchg /Applications/PlayCover.app

    # the nix binary was read only, our copy should ideally be read-write (for hadal84)
    chown -R "''${SUDO_USER:-$USER}":staff /Applications/PlayCover.app
    chmod -R u+w /Applications/PlayCover.app

    xattr -rc /Applications/PlayCover.app
  '';
}
