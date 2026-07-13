{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # misc
    libnotify
    fontconfig

    # utils
    dust
    duf
    fd
    file
    jaq
    ripgrep
    killall
    jq
    ps_mem
    dua # dust with tui
    xh # curl oxidized
    dysk
    tealdeer
    pulsemixer

    tesseract
    discordo
    fum
    glow
    gtt
    meteor-git # to write customizable commits
    reddit-tui
    scope-tui
    tuicam
    wiremix
    zfxtop
    nix-search-tv
    television
    bmm
    opencode
  ];

  programs = {
    eza.enable = true;
    dircolors = {
      enable = true;
      # enableNushellIntegration = true;
    };
    autojump = {
      enable = true;
      # enableNushellIntegration = true;
    };
  };
}
