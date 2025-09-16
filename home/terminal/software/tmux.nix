{
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nushell";
    escapeTime = 0;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    newSession = true;
    extraConfig = ''
          bind -n M-u attach-session -t . -c '#{pane_current_path}' \; display-message "Changed current working directory to #{pane_current_path}"
          bind-key U run-shell '
        dir=$(tmux display -p "#{pane_current_path}")
        i=1
        while tmux has-session -t "new-session-$i" 2>/dev/null; do
          i=$((i + 1))
        done
        tmux new-session -ds "new-session-$i" -c "$dir"
        tmux switch-client -t "new-session-$i"
      '

    '';
    plugins = with pkgs.tmuxPlugins; [
      sensible
      nord
      better-mouse-mode
      urlview
      #      {
      #	plugin = pkgs.tmuxPlugins.rose-pine;
      #	extraConfig = "set -g @rose_pine_variant 'main'"; # Options are 'main', 'moon' or 'dawn'"
      #      }
    ];
  };
}
}
