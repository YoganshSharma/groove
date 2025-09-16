{lib, ...}: {
  imports = [
    ./security.nix
    ./users.nix
    ../nix
    ../programs/nushell.nix
  ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "es_IN.UTF-8";
      LC_IDENTIFICATION = "es_IN.UTF-8";
      LC_MEASUREMENT = "es_IN.UTF-8";
      LC_MONETARY = "es_IN.UTF-8";
      LC_NAME = "es_IN.UTF-8";
      LC_NUMERIC = "es_IN.UTF-8";
      LC_PAPER = "es_IN.UTF-8";
      LC_TELEPHONE = "es_IN.UTF-8";
      LC_TIME = "es_IN.UTF-8";
    };
  };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
    };
  };


  # don't touch this
  system.stateVersion = lib.mkDefault "24.05";
  system = {
    switch.enable = true;
    rebuild.enableNg = true;
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
