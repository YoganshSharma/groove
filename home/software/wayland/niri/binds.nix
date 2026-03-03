{
  lib,
  inputs,
  config,
  pkgs,
  ...
}: let
  quickshell = inputs.quickshell.packages.${pkgs.system}.default;
in {

  programs.niri.settings.binds = with config.lib.niri.actions; let
    quickshellIpc = spawn "dms" "ipc";
    playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
  in {
    "XF86AudioPlay".action = playerctl "play-pause";
    "XF86AudioStop".action = playerctl "pause";
    "XF86AudioPrev".action = playerctl "previous";
    "XF86AudioNext".action = playerctl "next";

    "XF86AudioMute" = {
      allow-when-locked = true;
      action = quickshellIpc "audio" "mute";
    };
    "XF86AudioMicMute" = {
      allow-when-locked = true;
      action = quickshellIpc "audio" "micmute";
    };

    "XF86AudioRaiseVolume" = {
      allow-when-locked = true;
      action = quickshellIpc "audio" "increment" "5";
    };
    "XF86AudioLowerVolume" = {
      allow-when-locked = true;
      action = quickshellIpc "audio" "decrement" "5";
    };

    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action = quickshellIpc "brightness" "increment" "5" "";
    };

    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action = quickshellIpc "brightness" "decrement" "5" "" ;
    };

    "Ctrl+Alt+L".action = quickshellIpc "lock" "lock" ;
    "Mod+V".action = quickshellIpc "clipboard" "toggle" ;
    "Mod+U".action = quickshellIpc "settings" "toggle" ;
    "Mod+M".action = quickshellIpc "processlist" "toggle" ;

    "Print".action.screenshot-screen = {write-to-disk = true;};
    "Mod+Shift+Alt+S".action.screenshot-window = {write-to-disk = true;};
    # "Mod+Shift+Alt+S".action = screenshot-window;
    "Mod+Shift+S".action.screenshot = {show-pointer = false;};
    "Mod+D".action = quickshellIpc "spotlight" "toggle" ;
    "Mod+B".action = quickshellIpc "bar" "toggle" "index" "0";
    "Mod+Return".action = spawn "${lib.getExe pkgs.ghostty}";
    "Mod+T".action = spawn-sh '' ${lib.getExe pkgs.ghostty} -e tmux new-session -A -s home -c "$HOME" '';
    "Mod+W".action = spawn "${lib.getExe pkgs.firefox}";
    "Mod+Shift+B" = { 
      repeat = false;
      # action = spawn-sh "${lib.getExe pkgs.bash} -c \"pkill quickshell && dms run\"";
      action = spawn-sh "${lib.getExe pkgs.bash} -c \"dms restart\"";
     };

    "Mod+Q".action = close-window;
    "Mod+S".action = switch-preset-column-width;
    "Mod+F".action = maximize-column;

    "Mod+O" = {
      action = toggle-overview;
      repeat = false;
    };
    "Mod+Shift+F".action = expand-column-to-available-width;
    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;

    "Mod+Shift+1".action.move-column-to-workspace = 1;
    "Mod+Shift+2".action.move-column-to-workspace = 2;
    "Mod+Shift+3".action.move-column-to-workspace = 3;
    "Mod+Shift+4".action.move-column-to-workspace = 4;
    "Mod+Shift+5".action.move-column-to-workspace = 5;
    "Mod+Shift+6".action.move-column-to-workspace = 6;
    "Mod+Shift+7".action.move-column-to-workspace = 7;
    "Mod+Shift+8".action.move-column-to-workspace = 8;
    "Mod+Shift+9".action.move-column-to-workspace = 9;
    "Mod+Shift+Space".action = fullscreen-window;
    "Mod+Space".action = toggle-window-floating;
    "Mod+Shift+T".action = toggle-column-tabbed-display;

    "Mod+Comma".action = consume-window-into-column;
    "Mod+Period".action = expel-window-from-column;
    "Mod+C".action = center-visible-columns;
    "Mod+Tab".action = switch-focus-between-floating-and-tiling;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Equal".action = set-window-height "+10%";

    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;

    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+K".action = move-column-to-workspace-up;
    "Mod+Shift+J".action = move-column-to-workspace-down;

    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
    "Mod+Shift+Slash".action = show-hotkey-overlay;
  };
}
