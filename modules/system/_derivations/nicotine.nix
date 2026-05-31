{ stdenvNoCC }: 

stdenvNoCC.mkDerivation {
  pname = "nicotine-app";
  version = "1.0";
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/Applications/Nicotine.app/Contents/MacOS
    cat << 'EOF' > $out/Applications/Nicotine.app/Contents/MacOS/Nicotine
#!/bin/bash
/opt/homebrew/bin/nicotine > /dev/null 2>&1 &
EOF
    chmod +x $out/Applications/Nicotine.app/Contents/MacOS/Nicotine
  '';
}
