{ ... }:
{
  programs.ssh = {
    enable = true;

    addKeysToAgent = "1h";

    controlMaster = "auto";
    controlPath = "~/.ssh/control-%r@%h:%p";
    controlPersist = "10m";

    matchBlocks = {
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
    };
  };

  services.ssh-agent.enable = true;
}
