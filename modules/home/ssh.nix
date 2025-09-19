{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        addKeysToAgent = "1h";

        controlMaster = "auto";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlPersist = "10m";

        forwardAgent = false;
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
      };
      kelwin = {
        host = "kelwin";
        hostname = "ssh.github.com";
        user = "git";
        port = 443;
        identityFile = "~/.ssh/id_ed25519_kelwin";
        identitiesOnly = true;
      };
      mrrobot = {
        host = "mrrobot";
        hostname = "ssh.github.com";
        user = "git";
        port = 443;
        identityFile = "~/.ssh/id_ed25519_mrrobot";
        identitiesOnly = true;
      };
      codemasters = {
        host = "codemasters";
        hostname = "gitlab.itschool.pro";
        user = "git";
        port = 22;
        identityFile = "~/.ssh/id_ed25519_codemasters";
        identitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
