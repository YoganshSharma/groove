{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
    config = {
      volume = 100;
      volume-max = 200;
      osd-bar = "no";
      osc = "no";
      ytdl-format = "bestvideo[height<=720][fps<=30]+bestaudio";
      screenshot-directory = "~/Pictures/mpv";
      cache = true;
      demuxer-max-bytes = "500M";
      demuxer-max-back-bytes = "100M";
    };
    extraInput = ''
      Ctrl+f     script-binding quality_menu/video_formats_toggle
      Ctrl+r script-binding quality_menu/reload
      Alt+f script-binding quality_menu/audio_formats_toggle
    '';
    scripts = [
      pkgs.mpvScripts.seekTo
      pkgs.mpvScripts.thumbfast
      pkgs.mpvScripts.mpris
      pkgs.mpvScripts.webtorrent-mpv-hook
    ];

  };
}
