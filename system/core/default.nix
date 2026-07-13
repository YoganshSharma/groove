{
lib,
pkgs,
...
}: {
  imports = [
    ./security.nix
    ./users.nix
    ../nix
    ../programs/shells.nix
    # ../programs/steam.nix
  ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };

  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

  console.keyMap = "us";


  # don't touch this
  system.stateVersion = lib.mkDefault "25.11";
  system = {
    switch.enable = true;
    # rebuild.enableNg = true;
  };

    # set your time zone.
  time.timeZone = lib.mkDefault "Asia/Kolkata";

  time.hardwareClockInLocalTime = lib.mkDefault true;

  # compresses half the ram for use as swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };

  # TODO see if ndm problem is fixed
  # documentation = {
  #   enable = true;
  #   dev.enable = true;
  #   man = {
  #     enable = true;
  #     generateCaches = true;
  #   };
  #   nixos.enable = true;
  # };
  #


}
