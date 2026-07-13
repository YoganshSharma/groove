{pkgs, ...}: {
  imports = [
    ./obs.nix
    # ./rnnoise.nix # temporarily disabled
    ./mpv.nix
    ./feh.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pamixer
    alsa-utils
    easyeffects
  ];
}
