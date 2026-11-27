{ pkgs, ... }:

{
  fonts.packages = [
    (pkgs.runCommandLocal "hadal-fonts" { } ''
      install -Dm444 -t $out/share/fonts/truetype ${./font-files}/*.ttf
      install -Dm444 -t $out/share/fonts/truetype-collection ${./font-files}/*.ttc
    '')
  ];
}
