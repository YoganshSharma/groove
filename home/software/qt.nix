{ pkgs, ... }: {
  home.packages = with pkgs; [
    adwaita-icon-theme
    kdePackages.breeze-icons
  ];
  stylix.icons = {
    # keep enable = false to avoid gtk.iconTheme conflict
    enable = false;
    light = "Adwaita";
    dark = "Adwaita";
    package = pkgs.adwaita-icon-theme;
  };
}
