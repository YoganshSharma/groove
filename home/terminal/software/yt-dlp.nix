{ 
  programs.yt-dlp = {
    enable = true;
    settings = {
      embed-subs = true;
      embed-chapters = true;
      sub-langs = "all,-live_chat";
    };
  };
}
