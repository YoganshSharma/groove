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

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      ignoreUserConfig = true;
      addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-configtool
        fcitx5-mozc
        fcitx5-table-extra
      ];
      settings = {
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "mozc";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "mozc";
          "Groups/0/Items/2".Name = "keyboard-in-hin-wx";
          GroupOrder."0" = "Default";
        };
        globalOptions = {
          "Hotkey" = {
            EnumerateWithTriggerKeys = "True";
            ActivateKeys = "";
            DeactivateKeys = "";
            EnumerateSkipFirst = "False";
            EnumerateGroupForwardKeys = "";
            EnumerateGroupBackwardKeys = "";
            ModifierOnlyKeyTimeout = "250";
          };
          "Hotkey/TriggerKeys" = {
            "0" = "Control+Super+space";
          };
          "Hotkey/AltTriggerKeys" = {
            "0" = "Shift_L";
          };
          "Hotkey/EnumerateForwardKeys" = {
            "0" = "Control+Super+N";
          };
          "Hotkey/EnumerateBackwardKeys" = {
            "0" = "Control+Super+P";
          };
          "Hotkey/PrevPage" = {
            "0" = "Up";
          };
          "Hotkey/NextPage" = {
            "0" = "Down";
          };
          "Hotkey/PrevCandidate" = {
            "0" = "Shift+Tab";
          };
          "Hotkey/NextCandidate" = {
            "0" = "Tab";
          };
          "Hotkey/TogglePreedit" = {
            "0" = "Control+Alt+P";
          };
          "Behavior" = {
            ActiveByDefault = "False";
            resetStateWhenFocusIn = "No";
            ShareInputState = "No";
            PreeditEnabledByDefault = "True";
            ShowInputMethodInformation = "True";
            showInputMethodInformationWhenFocusIn = "False";
            CompactInputMethodInformation = "True";
            ShowFirstInputMethodInformation = "True";
            DefaultPageSize = "5";
            OverrideXkbOption = "False";
            CustomXkbOption = "";
            EnabledAddons = "";
            DisabledAddons = "";
            PreloadInputMethod = "True";
            AllowInputMethodForPassword = "False";
            ShowPreeditForPassword = "False";
            AutoSavePeriod = "30";
          };
        };
      };
    };
  };
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
