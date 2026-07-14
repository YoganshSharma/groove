{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    adwaita-icon-theme
    kdePackages.breeze-icons
    qt6Packages.qt6ct
  ];

  # Workaround for https://github.com/nix-community/stylix/issues/1958#issuecomment-3607824025
  # Stylix generates a KDE color scheme but doesn't link it to kdeglobals,
  # which breaks Kirigami/Qt apps that read colors from ~/.config/kdeglobals.
  xdg.configFile.kdeglobals.source =
    let
      themePackage = builtins.head (
        builtins.filter (
          p: builtins.match ".*stylix-kde-theme.*" (builtins.baseNameOf p) != null
        ) config.home.packages
      );
      colorSchemeSlug = lib.concatStrings (
        lib.filter lib.isString (builtins.split "[^a-zA-Z]" config.lib.stylix.colors.scheme)
      );
    in
    "${themePackage}/share/color-schemes/${colorSchemeSlug}.colors";

  stylix.icons = {
    enable = true;
    package = pkgs.catppuccin-papirus-folders.override {
      flavor = "mocha";
      accent = "mauve";
    };
    dark = "Papirus-Dark";
  };
}
