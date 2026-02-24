{config, ...}: {
  programs.ssh = {
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";

      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
