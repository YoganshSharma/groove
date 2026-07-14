{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
    adwaita-icon-theme
    kdePackages.breeze-icons
    qt6Packages.qt6ct
  ];
  # Required for Kirigami apps like kdeconnect
  home.sessionVariables.QT_QUICK_CONTROLS_STYLE = "Basic";
  # qt.platformTheme.name = lib.mkForce "qt6ct";
  stylix.icons = {
    enable = true;
    light = "Adwaita";
    dark = "Adwaita";
    package = pkgs.adwaita-icon-theme;
  };
}
