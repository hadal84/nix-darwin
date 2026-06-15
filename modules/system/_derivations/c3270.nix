{
  lib,
  stdenv,
  ncurses,
  openssl,
  readline,
  m4,
  suite3270-src,
}:

stdenv.mkDerivation rec {
  pname = "c3270";
  version = "4.3ga10";

  src = suite3270-src;

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
