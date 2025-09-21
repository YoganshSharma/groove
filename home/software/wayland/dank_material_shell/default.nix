{
  pkgs,
  inputs,
  ...
}: let
  quickshell = inputs.quickshell.packages.${pkgs.system}.default;
in {
  programs.dankMaterialShell = {
    enable = true;
    enableSpawn = true;
    enableCalendarEvents = true;

    quickshell.package = quickshell;
  };
}
