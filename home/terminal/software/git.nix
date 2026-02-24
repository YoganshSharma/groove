{ pkgs, ... }:
{
  home.packages = [ pkgs.gh ];

  # enable scrolling in git diff
  home.sessionVariables.DELTA_PAGER = "less -R";

  programs.git = {
    enable = true;
    lfs.enable = true;

    signing = {
      # key = "481EFFCF2C7B8C7B"; # TODO: Add your GPG key ID here
      signByDefault = true;
    };

    settings = {
      user.email = "yogansh@yogansh.tech";
      user.name = "Yogansh Sharma";
      init.defaultBranch = "main";
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";
      push.autoSetupRemote = true;
      core.editor = "nvim";
      push.default = "current";
      merge.stat = "true";
      core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      repack.usedeltabaseoffset = "true";
      pull.ff = "only";
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      alias = {
        co = "checkout";
        fuck = "commit --amend -m";
        ca = "commit -am";
        d = "diff";
        ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
        pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
        af = "!git add $(git ls-files -m -o --exclude-standard | fzf -m)";
        st = "status";
        br = "branch";
        df = "!git hist | peco | awk '{print $2}' | xargs -I {} git diff {}^ {}";
        hist = ''log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all'';
        llog = ''log --graph --name-status --pretty=format:"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset" --date=relative'';
        edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; hx `f`";
        clone-worktree = "!sh ${pkgs.writeScriptBin "cloneWorktree" (builtins.readFile ./bin/git_clone_worktree.sh)}/bin/cloneWorktree";

        remote-to-ghssh = ''
          !${
            pkgs.writeShellApplication {
              name = "gitRemoteSshUpdate";
              runtimeInputs = [
                pkgs.git
                pkgs.gnused
              ];
              text = ''
                #!/bin/sh
                remote="''${1:-origin}"
                url="$(git remote get-url "$remote" 2>/dev/null)" || { echo "Remote '$remote' not found"; exit 1; }
                ssh_url="$(echo "$url" | sed -E 's,^https://([^/]*)/(.*)$,git@\1:\2,')"
                git remote set-url "$remote" "$ssh_url"
                echo "Updated remote '$remote' to $ssh_url"
              '';
            }
          }/bin/gitRemoteSshUpdate
        '';
        gitignore = ''
          !${
            pkgs.writeShellApplication {
              name = "gitignore";
              runtimeInputs = [
                pkgs.curl
                pkgs.fzf
                pkgs.gnused
              ];
              text = ''
                #!/bin/sh
                if [ $# -gt 0 ]; then
                  curl -sL "https://www.gitignore.io/api/$*"
                  exit
                fi

                choices=$(curl -sL https://www.gitignore.io/api/list | tr ',' '\n')
                selected=$(printf "%s\n" "$choices" | fzf --multi --preview "curl -sL https://www.gitignore.io/api/{}")

                if [ -n "$selected" ]; then
                  curl -sL "https://www.gitignore.io/api/$(echo "$selected" | tr '\n' ',')"
                fi
              '';
            }
          }/bin/gitignore
        '';

      };
    };

    ignores = [
      "*~"
      "*.swp"
      "*result*"
      ".direnv"
      "node_modules"
    ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      side-by-side = true;
      true-color = "never";

      features = "unobtrusive-line-numbers decorations";
      unobtrusive-line-numbers = {
        line-numbers = true;
        line-numbers-left-format = "{nm:>4}│";
        line-numbers-right-format = "{np:>4}│";
        line-numbers-left-style = "grey";
        line-numbers-right-style = "grey";
      };
      decorations = {
        commit-decoration-style = "bold grey box ul";
        file-style = "bold blue";
        file-decoration-style = "ul";
        hunk-header-decoration-style = "box";
      };
    };
  };
}
