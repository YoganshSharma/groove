{
  pkgs,
  inputs,
  ...
}: let
  quickshell = inputs.quickshell.packages.${pkgs.system}.default;
in {
  programs.dankMaterialShell = {
    enable = true;
    niri.enableSpawn = true;
    enableCalendarEvents = false; # khal compilation fails https://gist.github.com/YoganshSharma/8ac68a8f0b6b4f835bacc5cf072164b1

    quickshell.package = quickshell;
  };
}
