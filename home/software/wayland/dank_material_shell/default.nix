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
    enableCalendarEvents = true;

    quickshell.package = quickshell;
  };
}
