{ config, pkgs, inputs, ... }:

let

  addons = pkgs.nur.repos.rycee.firefox-addons;

in

{
  programs.zen-browser = {
    enable = true;

    profiles.default = {
      isDefault = true;
      spacesForce = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "app.update.auto" = false;
        "app.update.enabled" = false;
        "zen.tabs.show-newtab-vertical" = false;
        "browser.toolbars.bookmarks.visibility" = "always";
	"browser.download.dir"= "/Users/hadal84/Desktop";
	"browser.download.useDownloadDir"= false;
      };

      spaces = {
        "home" = {
          id = "idontkno-what-thee-fuck-iamdoinggggg";
          position = 1000;
          icon = "🏠";
        };
        "school" = {
          id = "6dfedece-ceda-4c58-8b9f-3ccde137c25f";
          position = 2000;
          icon = "🎓";
        };
        "art" = {
          id = "143cf64d-9fa8-433f-8efc-38b9214df659";
          position = 3000;
          icon = "🎨";
        };
        "code" = {
          id = "5ccfbf4b-347f-49be-a6f5-5406cd97d757";
          position = 4000;
          icon = "💾";
        };
        "systems" = {
          id = "b48f9e73-ad94-429f-abe3-8966b62a38ec";
          position = 5000;
          icon = "";
        };
        "euphoria" = {
          id = "b12d90fd-9f21-40a1-8971-f0a0cfe19769";
          position = 6000;
          icon = "𖤓";
        };
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

      mods = [
        "ea1a5ace-f698-4b45-ab88-6e8bd3a563f0" # bookmark toolbar tweaks
     ];
    };
  };

  stylix.targets.zen-browser = {
    enable = true; 
    profileNames = [ "default" ];
  };

  home.file."Library/Application Support/zen/Profiles/default/chrome/userChrome.css".text = 
    config.programs.zen-browser.profiles.default.userChrome;

  home.file."Library/Application Support/zen/Profiles/default/chrome/userContent.css".text = 
    config.programs.zen-browser.profiles.default.userContent;

}
