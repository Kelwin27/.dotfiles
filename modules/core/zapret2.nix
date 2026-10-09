{ ... }:
{
  services.zapret2 = {
    enable = true;

    # Только исходящий HTTPS к бинарным кэшам Nix.
    # Покрывает cache.nixos.org (домен включает поддомены) и
    # nix-community.cachix.org. Остальной трафик не затрагивается:
    # профиль один, правило "first match wins" не даёт
    # более широким профилям его перехватить.
    profiles.nix = {
      parameters = [
        "--filter-tcp=443"
        "--payload=tls_client_hello"
        "--lua-desync=multisplit:pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1"
      ];
      hosts.include = [
        "nixos.org"
        "cachix.org"
      ];
    };
  };
}
