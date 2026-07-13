{ pkgs, ... }: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
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
          Behavior = {
            ActiveByDefault = false;
            resetStateWhenFocusIn = "No";
            ShareInputState = "No";
            PreeditEnabledByDefault = true;
            ShowInputMethodInformation = true;
            showInputMethodInformationWhenFocusIn = false;
            CompactInputMethodInformation = true;
            ShowFirstInputMethodInformation = true;
            DefaultPageSize = 5;
            OverrideXkbOption = false;
            CustomXkbOption = "";
            EnabledAddons = "";
            DisabledAddons = "";
            PreloadInputMethod = true;
            AllowInputMethodForPassword = false;
            ShowPreeditForPassword = false;
            AutoSavePeriod = 30;
          };
          Hotkey = {
            EnumerateWithTriggerKeys = true;
            ActivateKeys = "";
            DeactivateKeys = "";
            EnumerateSkipFirst = false;
            EnumerateGroupForwardKeys = "";
            EnumerateGroupBackwardKeys = "";
            ModifierOnlyKeyTimeout = 250;
          };
          "Hotkey/TriggerKeys"."0" = "Control+Super+space";
          "Hotkey/AltTriggerKeys"."0" = "Shift_L";
          "Hotkey/EnumerateForwardKeys"."0" = "Control+Super+N";
          "Hotkey/EnumerateBackwardKeys"."0" = "Control+Super+P";
          "Hotkey/PrevPage"."0" = "Up";
          "Hotkey/NextPage"."0" = "Down";
          "Hotkey/PrevCandidate"."0" = "Shift+Tab";
          "Hotkey/NextCandidate"."0" = "Tab";
          "Hotkey/TogglePreedit"."0" = "Control+Alt+P";
        };
        addons.classicui = {
          globalSection = {
            Theme = "default";
            VerticalLayout = false;
          };
        };
      };
    };
  };
}
