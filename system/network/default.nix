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
    stevenBlackHosts = {
      enable = true;
      enableIPv6 = true;
      blockGambling = true;
      blockPorn = true;
    };
    firewall = {
        enable = false;
        allowedTCPPorts = [4444];

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
      dnsovertls = "opportunistic";
    };
  };

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
  environment.etc.hosts.enable = false;
}
