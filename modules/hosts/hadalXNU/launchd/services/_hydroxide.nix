{ config, pkgs, ... }:

{
  system.activationScripts.ensureHydroxideDir = {
  text = ''
    DIR="/Users/hadal84/Library/Application Support/hydroxide"
    if [ ! -d "$DIR" ]; then
      mkdir -p "$DIR"
      chown hadal84 "$DIR"
    fi
  '';
  deps = []; 
  };

  age.secrets.hydroxide = {
    file = ../../../../../secrets/hydroxide.age; 
    path = "${config.users.users.hadal84.home}/.hydroxide-seed.json";
    owner = "hadal84";
  };

  launchd.user.agents.hydroxide = {
    path = [ pkgs.coreutils pkgs.hydroxide ];
    
    script = ''
      export HOME="${config.users.users.hadal84.home}"
      export USER="hadal84"
      
      TARGET_DIR="$HOME/Library/Application Support/hydroxide"
      TARGET_FILE="$TARGET_DIR/auth.json"
      SEED_FILE="$HOME/.hydroxide-seed.json"

      mkdir -p "$TARGET_DIR"

      if [ ! -f "$TARGET_FILE" ] || [ -L "$TARGET_FILE" ]; then
        rm -f "$TARGET_FILE"
        cp "$SEED_FILE" "$TARGET_FILE"
        chmod 600 "$TARGET_FILE"
      fi

      exec hydroxide serve
    '';
    
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true;
      ProcessType = "Background";
      StandardOutPath = "${config.users.users.hadal84.home}/Library/Logs/hydroxide.log";
      StandardErrorPath = "${config.users.users.hadal84.home}/Library/Logs/hydroxide.err.log";
    }; 
  };
}
