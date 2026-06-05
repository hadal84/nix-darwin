{ config, pkgs, inputs, ... }:

let

  addons = pkgs.nur.repos.rycee.firefox-addons;

in

{
  programs.zen-browser = {
    enable = true;

    profiles.default = {
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "app.update.auto" = false;
        "app.update.enabled" = false;
      };

      extensions.packages = with addons; [
        ublock-origin
        bitwarden
        sponsorblock
        darkreader
        translate-web-pages
        untrap-for-youtube
        vimium-c
        violentmonkey
        zotero-connector
      ];
      
    };
  };

  home.file."Library/Application Support/zen/Profiles/default/chrome" = {
    source = ./chrome;
    force = true; 
  };
}


