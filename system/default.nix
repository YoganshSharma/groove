let
  desktop = [
    ./core/boot.nix
    ./core/default.nix

    ./hardware/graphics.nix
    ./hardware/fwupd.nix

    ./network/default.nix
    ./network/avahi.nix

    ./programs

    ./services
    ./services/ananicy.nix
    # ./services/greetd.nix
    ./services/qbittorrent.nix
    ./services/sddm.nix
    ./services/pipewire.nix

    ./services/tor.nix
  ];

  laptop =
    desktop
    ++ [
      ./hardware/bluetooth.nix

      ./services/backlight.nix
      ./services/power.nix
    ];
in {
  inherit desktop laptop;
}
