{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [pkgs.libsixel];
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        # font = "Adwaita Mono:size=15:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga";
        # dpi-aware = "yes";
        horizontal-letter-offset = 0;
        vertical-letter-offset = 0;
        pad = "15x6center";
        term = "xterm-256color";
        selection-target = "clipboard";
        # include = "${config.xdg.configHome}/foot/dank-colors.ini"; # or theme.ini if you want matugen dms
        shell = "${pkgs.fish}/bin/fish";
      };
      desktop-notifications.command = "${lib.getExe pkgs.libnotify} -a \${app-id} -i \${app-id} \${title} \${body}";
      scrollback = {
        lines = 10000;
        multiplier = 3;
        indicator-position = "relative";
        indicator-format = "line";
      };
      url = {
        launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
      };
      cursor = {
        style = "beam";
        beam-thickness = "2";
      };
      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
      colors-dark = {
        alpha = 1.0;
      };
      colors-light = {
        alpha = 1.0;
      };
    };
  };
}
