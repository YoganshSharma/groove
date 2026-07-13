{
  home.file."notes/.zk/templates/default.md".text = ''
    # {{title}}

    {{content}}
  '';

  home.file."notes/.zk/templates/daily.md".text = ''
    # {{format-date now "long"}}

    What did I do today?
  '';

  home.file."notes/.zk/templates/weekly.md".text = ''
    # Week {{format-date now "%V"}} - {{format-date now "long"}}

    ## Wins

    ## Challenges

    ## Next week
  '';

  home.file."notes/.zk/templates/meeting.md".text = ''
    # {{title}}

    Date: {{format-date now "long"}}
    Attendees:

    ## Agenda

    ## Notes

    ## Action items
  '';

  programs.zk = {
    enable = true;
    settings = {
      notebook.dir = "~/notes";

      note = {
        language = "en";
        default-title = "Untitled";
        filename = "{{id}}-{{slug title}}";
        extension = "md";
        template = "default.md";
        id-charset = "alphanum";
        id-length = 4;
        id-case = "lower";
      };

      extra.author = "Yogansh";

      format.markdown = {
        hashtags = true;
        colon-tags = true;
      };

      tool = {
        editor = "nvim";
        shell = "/run/current-system/sw/bin/fish";
        pager = "less -FIRX";
        fzf-preview = "bat -p --color always {-1}";
      };

      group = {
        journal = {
          paths = ["journal/daily" "journal/weekly"];
          note = {
            filename = "{{format-date now '%Y-%m-%d'}}";
            extension = "md";
            template = "daily.md";
          };
        };
        meetings = {
          paths = ["meetings"];
          note = {
            filename = "{{format-date now '%Y-%m-%d'}}-{{slug title}}";
            extension = "md";
            template = "meeting.md";
          };
        };
        projects = {
          paths = ["projects/**"];
          note = {
            filename = "{{id}}-{{slug title}}";
            extension = "md";
            template = "default.md";
          };
        };
      };

      filter = {
        recents = "--sort created- --created-after 'last two weeks'";
        journal = "--sort created- --path 'journal/**'";
      };

      alias = {
        edlast = "zk edit --limit 1 --sort modified- $@";
        recent = "zk edit --sort created- --created-after 'last two weeks' --interactive";
        lucky = "zk list --quiet --format full --sort random --limit 1";
        daily = ''zk new --no-input "$ZK_NOTEBOOK_DIR/journal/daily"'';
        week = ''zk new --no-input "$ZK_NOTEBOOK_DIR/journal/weekly"'';
      };

      lsp.diagnostics = {
        wiki-title = "hint";
        dead-link = "error";
        missing-backlink = {
          level = "warning";
          position = "bottom";
        };
      };
    };
  };
}
