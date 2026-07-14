{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    settings = {
      confirm-close-surface = false;
    };
  };
}
