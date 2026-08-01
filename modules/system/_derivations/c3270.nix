{
  lib,
  stdenv,
  ncurses,
  openssl,
  readline,
  m4,
  src,
}:

stdenv.mkDerivation rec {
  pname = "c3270";
  version = "4.3ga10";

  inherit src;

  nativeBuildInputs = [ m4 ];
  buildInputs = [
    ncurses
    openssl
    readline
  ];

  configureFlags = [
    "--enable-c3270"
    "--disable-x3270"
  ];

  buildPhase = ''
    make c3270
  '';

  installPhase = ''
    mkdir -p $out/bin
    find obj -type f -name c3270 -exec cp {} $out/bin/ \;
  '';

  meta = with lib; {
    description = "Curses-based IBM 3270 terminal emulator";
    platforms = platforms.unix;
  };
}
