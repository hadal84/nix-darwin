{ pkgs, config, ... }:

{
  system.defaults = {

   dock = {
   autohide=true; # automatically put away the dock when not in use
   mineffect="scale"; # set the minimization animation to scaling 
   minimize-to-application=true; # minimize to app icon
   show-process-indicators=false; # do not show process indicators
   show-recents=false; # do not show recent applications
   expose-animation-duration = 0.0; # dock resize time
   autohide-time-modifier = 0.0;
   autohide-delay = 0.0;

   wvous-tr-corner=3; # top right hot corner displays all windows of focused app
   wvous-tl-corner=1; # top left hot corner is disabled
   wvous-br-corner=1; # bottom right hot corner is disabled
   wvous-bl-corner=1; # bottom left hot corner is disabled
   };

   WindowManager = {
   EnableStandardClickToShowDesktop=false; # clicking the desktop will not put the windows out of the way
   StandardHideDesktopIcons=true; # hide icons on desktop
   };

   finder = {
   NewWindowTarget="Desktop"; # open new finder windows at ~/Desktop
   CreateDesktop=false; # do not show icons on Desktop
   AppleShowAllExtensions=true; # show all file extensions by default
   AppleShowAllFiles=true; # show dotfiles
   FXEnableExtensionChangeWarning=false; # do not show warnings when changing file extensions
   FXPreferredViewStyle="icnv"; # list folder contents as icons
   ShowPathbar=true; # show the pathbar
   ShowStatusBar=true; # show statusbar
   _FXEnableColumnAutoSizing=true; # automatically expand columns to fit filenames
   };

   NSGlobalDomain = {
   AppleInterfaceStyle = "Dark"; # force macOS into dark mode
   KeyRepeat = 2; # use the minimal key repeat time
   "com.apple.swipescrolldirection" = true; # enable reverse scrolling
   AppleScrollerPagingBehavior=true; # jump to the clicked section when clicked on scrollbar
   NSScrollAnimationEnabled=true; # enable smooth scrolling
   NSNavPanelExpandedStateForSaveMode=true; # always use the expanded save panel
   _HIHideMenuBar=true; # hide the menu bar
   NSWindowResizeTime = 0.001; # resize time for yabai

   # english massacre
   NSAutomaticSpellingCorrectionEnabled=false; # turn off auto-correct
   NSAutomaticQuoteSubstitutionEnabled=false; # turn off quote substitution
   NSAutomaticPeriodSubstitutionEnabled=false; # turn off period substitution
   NSAutomaticCapitalizationEnabled=false; # god forbid a girl aura farm
   };

   CustomUserPreferences = {
    "com.apple.desktopservices" = {
      # Avoid creating .DS_Store files on network or USB volumes
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
     };
   };

   hitoolbox.AppleFnUsageType="Do Nothing"; # fn key does nothing.
   SoftwareUpdate.AutomaticallyInstallMacOSUpdates=false; # disable automatic software updates
   spaces.spans-displays = false; # displays have seperate spaces = true (its counter-intuitive ik)
  };

  security.pam.services.sudo_local.touchIdAuth = true;
  
  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        # disable "save picture of screen as a file" (cmd + shift + 3)
        "28" = { enabled = false; };
        # disable "copy picture of screen to the clipboard" (ctrl + cmd + shift + 3)
        "29" = { enabled = false; };
        # disable "save picture of selected area as a file" (cmd + shift + 4)
        "30" = { enabled = false; };
        # disable "copy picture of selected area to the clipboard" (ctrl + cmd + shift + 4)
        "31" = { enabled = false; };
        # disable "screenshot and recording options" (cmd + shift + 5)
        "184" = { enabled = false; };

        "64" = {
          enabled = false;
          value = {
            parameters = [ 32 49 1048576 ];
            type = "standard";
          };
        };
       };
     };
  };
  

  system.activationScripts.postActivation.text = ''
  echo "Purging .DS_Store files from configuration tree..."
  find /Users/hadal84/nix-darwin -name ".DS_Store" -type f -delete
  '';

}
