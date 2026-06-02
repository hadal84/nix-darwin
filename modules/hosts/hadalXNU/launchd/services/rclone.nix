{ config, pkgs, ... }: {

  age.secrets.rclone-config = {
    file = ../../../../../secrets/rclone.age; 
    path = "/etc/rclone/rclone.conf";
    owner = "hadal84";
  };

  launchd.user.agents.rclone-gdrive = {
    command = toString (pkgs.writeShellScript "mount-gdrive" ''
      mkdir -p "$HOME/Google Drive"

      exec ${pkgs.rclone}/bin/rclone mount gdrive: "$HOME/Google Drive" \
        --config ${config.age.secrets.rclone-config.path} \
        --vfs-cache-mode full \
        --vfs-cache-max-age 24h \
        --vfs-cache-max-size 10G \
        --volname "GoogleDrive" \
        --log-level INFO
    '');

    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = {
        Crashed = true;
        SuccessfulExit = false;
      };
      ProcessType = "Background";
      StandardOutPath = "/Users/hadal84/Library/Logs/rclone-gdrive.log";
      StandardErrorPath = "/Users/hadal84/Library/Logs/rclone-gdrive.err.log";
    };
  };
}
