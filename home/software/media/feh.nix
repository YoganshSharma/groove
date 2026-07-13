{pkgs, ...}: {
  programs.feh = {
    enable = true;
    keybindings = {
      quit = "q";
      prev_img = "h";
      next_img = "l";
      scroll_down = "j";
      scroll_up = "k";
      reload = "r";
      toggle_fullscreen = "f";
      toggle_display = "slash";
      zoom_in = "plus";
      zoom_out = "minus";
    };
  };

  services.random-background = {
    enable = true;
    imageDirectory = "~/wallpapers";
    interval = "5m";
  };
}
