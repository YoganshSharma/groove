{
  pkgs,
  lib,
  ...
}:
let
  aw-watcher-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "aw-watcher-tmux";
    version = "1.0.0";
    rtpFilePath = "aw-watcher-tmux.tmux";
    src = pkgs.fetchFromGitHub {
      owner = "akohlbecker";
      repo = "aw-watcher-tmux";
      rev = "efaa7610add52bd2b39cd98d0e8e082b1e126487";
      sha256 = "sha256-L6YLyEOmb+vdz6bJdB0m5gONPpBp2fV3i9PiLSNrZNM=";
    };
    meta = {
      homepage = "https://github.com/akohlbecker/aw-watcher-tmux";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    escapeTime = 0;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    newSession = true;
    extraConfig = ''
      # Bind Alt+u to update the current session's root directory to the active pane's path
      bind -n M-u attach-session -t . -c '#{pane_current_path}' \; display-message "Changed current working directory to #{pane_current_path}"

      # Bind Shift+u to spawn and switch to a new isolated session in the current path
      bind-key U run-shell " \
        dir=\$(tmux display -p '#{pane_current_path}') && \
        i=1 && \
        while tmux has-session -t \"new-session-\$i\" 2>/dev/null; do \
          i=\$((i + 1)); \
        done && \
        tmux new-session -ds \"new-session-\$i\" -c \"\$dir\" && \
        tmux switch-client -t \"new-session-\$i\" \
      "
    '';
    plugins = with pkgs.tmuxPlugins; [
      sensible
      nord
      better-mouse-mode
      urlview
      # aw-watcher-tmux # this disables the extraConfig keybinds for some reason
    ];
  };
}
