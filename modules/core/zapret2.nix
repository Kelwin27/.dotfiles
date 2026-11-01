{ ... }:
{
  services.zapret2 = {
    enable = true;

    profiles.nix = {
      parameters = [
        "--filter-tcp=443"
        "--payload=tls_client_hello"
        "--lua-desync=fakedsplit:pos=1,midsld:tcp_ts=-1000"
      ];
      hosts.include = [
        "nixos.org"
        "cachix.org"
        "models.dev"
      ];
    };
  };
}
