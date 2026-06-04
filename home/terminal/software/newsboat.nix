{
  programs.newsboat = {
    enable = true;
    extraConfig = ''
      unbind-key j
      unbind-key k
      unbind-key h
      unbind-key H
      unbind-key L
      unbind-key c
      unbind-key ,

      # Feed settings
        prepopulate-query-feeds yes
        refresh-on-startup yes
        notify-always yes
      notify-beep yes
      notify-program notify-send

      macro w set browser "setsid -f mpv --player-operation-mode=pseudo-gui %u" ; open-in-browser ; set browser firefox
      macro m set browser "setsid -f deluge-console -q add %u&& notify-send 'Torrent added'"; open-in-browser; set browser firefox
      macro c set browser "printf %u|xclip -selection clipboard" ; open-in-browser ; set browser firefox
      # bind keys
      bind-key SPACE macro-prefix
      bind-key h quit
      bind-key BACKSPACE quit
      bind-key j down
      bind-key k up
      bind-key l open
      bind-key d pagedown
      bind-key u pageup
      bind-key H prev-feed
      bind-key L next-feed
      bind-key c toggle-show-read-feeds

      color background default default
      color listnormal default default
      color listnormal_unread default default
      color listfocus color16 color15
      color listfocus_unread color16 color15
      color info default black
      color article default default

      highlight article "(^Feed:.*|^Title:.*|^Author:.*)" cyan default bold
      highlight article "(^Link:.*|^Date:.*)" default default
      highlight article "https?://[^ ]+" green default

      highlight article "^(Title):.*$" blue default
      highlight article "\\[[0-9][0-9]*\\]" magenta default bold
      highlight article "\\[image\\ [0-9]+\\]" green default bold
      highlight article "\\[embedded flash: [0-9][0-9]*\\]" green default bold
      highlight article ":.*\\(link\\)$" cyan default
      highlight article ":.*\\(image\\)$" blue default
      highlight article ":.*\\(embedded flash\\)$" magenta default
    '';
    urls = [
      {
        title = "NixOS Stories";
        url = "https://nixos.org/blog/stories-rss.xml";
        tags = [
          "nix"
          "tech"
          "blog"
        ];
      }
      {
        title = "NixOs Announcements";
        url = "https://nixos.org/blog/announcements-rss.xml";
        tags = [
          "nix"
          "tech"
          "blog"
        ];
      }
      {
        title = "Phil Eaton";
        url = "https://notes.eatonphil.com/rss.xml";
        tags = [
          "tech"
          "blog"
        ];
      }
      {
        title = "Fasterthanlime blog";
        url = "https://fasterthanli.me/index.xml";
        tags = [
          "tech"
          "blog"
          "rust"
        ];
      }
      {
        url = "https://smallcultfollowing.com/babysteps//index.xml";
        tags = [
          "tech"
          "blog"
          "rust"
        ];
      }
      {
        title = "Rust Main blog";
        url = "https://blog.rust-lang.org/feed.xml";
        tags = [
          "tech"
          "blog"
          "rust"
        ];
      }
      {
        title = "Inide Rust blog";
        url = "https://blog.rust-lang.org/inside-rust/feed.xml";
        tags = [
          "tech"
          "blog"
          "rust"
        ];
      }
      {
        url = "https://blog.kubukoz.com/atom.xml";
        tags = [
          "tech"
          "blog"
          "nix"
          "scala"
        ];
      }
      {
        url = "https://blog.pragmaticengineer.com/rss/";
        tags = [
          "tech"
          "blog"
        ];
      }
      {
        title = "Bitcoin Alerts";
        url = "https://bitcoin.org/en/rss/alerts.rss";
        tags = [
          "tech"
          "blog"
          "bitcoin"
        ];
      }
      {
        title = "Bitcoin Conferences and Events";
        url = "https://bitcoin.org/en/rss/events.rss";
        tags = [
          "tech"
          "blog"
          "bitcoin"
        ];
      }
      {
        title = "Bitcoin Core";
        url = "https://bitcoincore.org/en/rss/";
        tags = [
          "tech"
          "blog"
          "bitcoin"
        ];
      }
      {
        url = "http://feeds.feedburner.com/martinkl";
        tags = [
          "tech"
          "blog"
        ];
      }
      {
        url = "https://jvns.ca/atom.xml";
        tags = [
          "tech"
          "blog"
        ];
      }
      {
        url = "https://ciechanow.ski/atom.xml";
        tags = [
          "tech"
          "blog"
        ];
      }
      {
        url = "https://this-week-in-rust.org/atom.xml";
        tags = [
          "rust"
          "tech"
        ];
      }
      {
        url = "https://anchor.fm/s/fb29b160/podcast/rss";
        tags = [
          "podcast"
          "tech"
        ];
      }
      {
        url = "https://nixos.org/blog/newsletters-rss.xml";
        tags = [
          "tech"
          "blog"
          "nix"
        ];
      }
      {
        url = "https://jade.fyi/rss.xml";
        tags = [
          "tech"
          "blog"
          "nix"
        ];
      }
      {
        url = "https://journal.stuffwithstuff.com/atom.xml";
        tags = [
          "tech"
          "blog"
        ];
      }
      {
        url = "https://atthis.link/rss.xml";
        tags = [
          "tech"
          "blog"
        ];
      }
      {
        url = "http://blog.golang.org/feed.atom";
        tags = [
          "tech"
          "blog"
          "golang"
        ];
      }
      {
        url = "https://blog.acharyaprashant.org/rss";
        tags = [
          "blog"
          "philosophy"
        ];
      }
      {
        url = "https://www.celextel.org/rss.php";
        tags = [
          "blog"
          "philosophy"
        ];
      }
      {
        title = "Acharya Prashant Articles Hindi";
        url = "https://fetchrss.com/rss/6758903f933364e31a04aa1267588ffbca613209490a9ac2.atom";
        tags = [
          "blog"
          "philosophy"
        ];
      }
      {
        title = "Acharya Prashant Articles English";
        url = "https://fetchrss.com/rss/6758903f933364e31a04aa12675890a32fcf7a06ec0613a3.atom";
        tags = [
          "blog"
          "philosophy"
        ];
      }
      {
        url = "https://bevyengine.org/atom.xml";
        tags = [
          "blog"
          "tech"
          "rust"
        ];
      }
      {
        url = "https://sabrinajewson.org/blog/feed.xml";
        tags = [
          "blog"
          "tech"
          "rust"
        ];
      }
      {
        url = "https://pablo.tools/atom.xml";
        tags = [
          "blog"
          "tech"
          "nix"
          "kinesis"
        ];
      }
      {
        url = "https://notashelf.dev/rss.xml";
        tags = [
          "blog"
          "tech"
          "nix"
        ];
      }
      {
        url = "https://lobste.rs/rss";
        tags = [
          "blog"
          "tech"
          "hackernews"
        ];
      }

      {
        url = "https://notthebe.ee/rss.xml";
        tags = [
          "blog"
          "tech"
          "nix"
        ];
      }
      {
        url = "https://grahamc.com/feed";
        tags = [
          "blog"
          "tech"
          "nix"
        ];
      }
      {
        url = "https://xeiaso.net/blog.rss";
        tags = [
          "blog"
          "tech"
          "nix"
        ];
      }
      {
        url = "https://sysid.github.io/blog/index.xml";
        tags = [
          "blog"
          "tech"
        ];
      }

      {
        title = "One Piece Spoilers";
        url = "https://otakukart.com/category/onepiece/feed/";
        tags = [
          "blog"
          "anime"
          "onepiece"
        ];
      }
      {
        title = "Anime News Network";
        url = "https://www.animenewsnetwork.com/all/rss.xml?ann-edition=in";
        tags = [
          "blog"
          "anime"
        ];
      }
      {
        title = "MyAnimeList News";
        url = "https://myanimelist.net/news/rss.xml";
        tags = [
          "blog"
          "anime"
        ];
      }
      {
        title = "Soham Sen's Blog";
        url = "https://blog.sohamsen.me/en/index.xml";
        tags = [
          "blog"
          "tech"
          "kgp"
        ];
      }
      {
        title = "LWN.net Headlines";
        url = "https://lwn.net/headlines/rss";
        tags = [
          "blog"
          "tech"
        ];
      }
      {
        title = "Rajiv Harlalka's Blog";
        url = "https://rajivharlalka.in/rss.xml";
        tags = [
          "blog"
          "tech"
          "kgp"
        ];
      }
      {
        title = "Hacker News";
        url = "https://news.ycombinator.com/rss";
        tags = [
          "blog"
          "tech"
          "hackernews"
        ];
      }
      {
        url = "https://fractalfir.github.io/generated_html/rss.xml";
        tags = [
          "blog"
          "tech"
          "rust"
        ];
      }
      {
        url = "https://blog.m-ou.se/index.xml";
        tags = [
          "blog"
          "tech"
          "rust"
        ];
      }
      {
        title = "George Hotz's";
        url = "https://geohot.github.io//blog/feed.xml";
        tags = [
          "blog"
          "tech"
        ];
      }
      {
        url = "https://www.gingerbill.org/article/index.xml";
        tags = [
          "blog"
          "tech"
          "zig"
        ];
      }

    ];

  };
}
