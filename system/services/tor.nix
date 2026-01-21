{pkgs, ...}: {
  services.tor = {
    enable = true;
    settings = {
    UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      UseBridges = true;
      Bridge = "obfs4 [2a02:c207:2284:7074::1]:33333 2F311EB4E8F0D50700E0DF918BF4E528748ED47C cert=xzae4w6xtbCRG4zpIH7AozSPI0h+lKzbshhkfkQBkmvB/DSKWncXhfPpFBNi5kRrwwVLew iat-mode=0";
      # Bridge = "obfs4 [2a01:cb10:85e5:9000:36e6:d7ff:fe17:32a2]:9003 2CE4C45EB1F42AA7E39E607C409E7235C76D9C28 cert=zYtVN6DtBOKs3nmCqdSbIx2x7gaI2XXaflpekjbYfha6k/lb7xoC6WizhYtZqWCg2N0QQA iat-mode=0";

    };
    client.enable = true;
  };
}

