{pkgs, ...}: {
  programs = {
    carapace.enable = true;
    carapace.enableFishIntegration = true;
    fish = {
      enable = true;
      shellInit = ''
        set -g fish_greeting
      '';
      shellAbbrs = {
        blt = "bluetoothctl";
      };
      plugins = with pkgs.fishPlugins; [
        {
          name = "tide";
          src = tide;
        }
      ];
      functions = {
        gitignore = ''
          if test (count $argv) -gt 0
            curl -sL "https://www.gitignore.io/api/(string join , $argv)"
          else
            curl -sL https://www.gitignore.io/api/list | tr ',' '\n' | fzf --multi --preview 'curl -sL https://www.gitignore.io/api/{}' | string join , | xargs -I{} curl -sL "https://www.gitignore.io/api/{}"
          end
        '';
        git_remote_http_to_ssh_update = ''
          set r (or $argv[1] origin)
          git remote set-url $r (git remote get-url $r | sed -E 's,^https://([^/]*)/(.*)$,git@\1:\2,')
        '';
      };
    };
  };
}
