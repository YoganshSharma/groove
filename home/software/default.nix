{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./anyrun
    #./browsers/chromium.nix
    ./browsers/zen.nix
    ./gtk.nix
    ./media
  ];

  home.packages = with pkgs; [
    # messaging
    telegram-desktop
    vesktop
    discord

    # misc
    pciutils
    nixos-icons
    colord
    cliphist
    ffmpegthumbnailer
    imagemagick
    nodejs
    nodePackages.pnpm
    bun

    fastfetch

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

    swww
    ghostty
    mods

    inputs.kixvim.packages.${system}.default
    inputs.sessionizer.packages.${system}.default
  ];
}
