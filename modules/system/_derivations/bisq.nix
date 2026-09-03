{ src, lib, stdenvNoCC, undmg }:

stdenvNoCC.mkDerivation rec {
  pname = "bisq";
  version = "latest";

  inherit src;

  nativeBuildInputs = [ undmg ];

  sourceRoot = ".";

  unpackPhase = ''
    runHook preUnpack
    
    undmg "$src"
    
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -R *.app "$out/Applications/"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Bisq1 Desktop Application";
    homepage = "https://bisq.network";
    platforms = platforms.darwin;
  };
}
