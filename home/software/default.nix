{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    #./browsers/chromium.nix
    #./browsers/zen.nix
    ./gtk.nix
    ./media
    ./documents
    ./wayland
    ./fcitx5.nix
    ./qt.nix
    ./social/discord
  ];

  home.packages = with pkgs; [
    # messaging
    telegram-desktop
    # vesktop #in home/default
    # discord

    # misc
    pciutils
    nixos-icons
    colord
    cliphist
    ffmpegthumbnailer
    ffmpeg
    imagemagick
    fzf
    nodejs
    pnpm
    bun

    fastfetch

    # backup for niri
    alacritty

    # gnome
    amberol
    (celluloid.override {youtubeSupport = true;})
    dconf-editor
    file-roller
    gnome-control-center
    gnome-text-editor
    # keypunch
    loupe
    nautilus
    (papers.override {supportNautilus = true;})
    pwvucontrol
    resources

    inkscape
    firefox
    # krita
    scrcpy
    multiviewer-for-f1

    awww
    mods
    calibre
    anki

    inputs.kixvim.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.sessionizer.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
