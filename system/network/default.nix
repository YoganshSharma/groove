# networking configuration
{pkgs, ...}: {
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];
    nftables.enable = true;
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.powersave = true;
    };
    firewall = {
        enable = true;
        allowedTCPPorts = [4444 59100 59010]; # 4444 for Syncthing GUI, 59010 and 59100 for Audio Relay

        ## For KDE Connect
        allowedTCPPortRanges = [
          { from = 1714; to = 1764; }
        ];
        allowedUDPPortRanges = [
          { from = 1714; to = 1764; }
        ];

      };
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    # DNS resolver
    resolved = {
      enable = true;
      settings.Resolve.DNSOverTLS = "opportunistic";
    };
  };

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
  environment.etc.hosts.enable = false;
}
