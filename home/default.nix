{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./terminal
    inputs.nix-index-db.homeModules.nix-index
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri

    inputs.nixcord.homeModules.nixcord
    inputs.stylix.homeModules.stylix
  ];
  home = {
    username = "yogansh";
    homeDirectory = "/home/yogansh";
    stateVersion = "26.05";
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;
  programs.nix-index = {
    enable = true;
    # enableNushellIntegration = true;
  };

  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    opacity = {
      popups = 1.0;
      terminal = 1.0;
    };

    fonts = {
      serif = config.stylix.fonts.sansSerif;
      sansSerif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.geist-mono;
        name = "GeistMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    base16Scheme = "${inputs.self}/home/shared/colors/charm.yaml";

    targets = {
      alacritty.enable = true;
      anki.enable = true;
      bat.enable = true;
      btop.enable = true;
      dank-material-shell.enable = true;
      nixcord.enable = true;
      fcitx5.enable = true;
      feh.enable = true;
      # firefox.enable = true;  # see the docs, TODO make firefox declarative
      fish.enable = true;
      foot.enable = true;
      fzf.enable = true;
      ghostty.enable = true;
      gtk.enable = true;
      mpv.enable = true;
      niri.enable = true;
      nixos-icons.enable = true;
      nushell.enable = true;
      opencode.enable = true;
      qt.enable = true;
      sioyek.enable = true;
      starship.enable = true;
      tmux.enable = true;
      vesktop.enable = true;
      vscode.enable = true;
      yazi.enable = true;
      zathura.enable = true;
      zed.enable = true;
    };
  };
  home.file.".face" = {
    source = ./users/yogansh.png;
  };
}
