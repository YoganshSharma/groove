{ pkgs, ... }:
let
  watcherService = {
    unit = {
      After = [ "graphical-session.target" ];
      BindsTo = [ "graphical-session.target" ];
    };
    service = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
in {
  services.activitywatch = {
    enable = true;
    watchers = {
      aw-watcher-afk = {
        package = pkgs.aw-watcher-afk;
        settings = {
          timeout = 300;
          poll_time = 2;
        };
      };
      aw-watcher-window-wayland = {
        package = pkgs.aw-watcher-window-wayland;
        settings = {
          poll_time = 1;
          exclude_title = true;
        };
      };
    };
  };

  systemd.user.services = {
    "activitywatch-watcher-aw-watcher-afk" = watcherService;
    "activitywatch-watcher-aw-watcher-window-wayland" = watcherService;
  };
}
