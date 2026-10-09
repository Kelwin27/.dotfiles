{ pkgs, lib, ... }:
let
  # Секретов здесь нет: реальный приватный ключ лежит в
  # ~/.config/sing-box/warp.key (600, вне git), а в шаблоне только плейсхолдер.
  # Поле reserved не является секретом — эти 3 байта идут открытым текстом
  # в каждом WireGuard handshake.
  template = pkgs.writeText "sing-box-template.json" (
    builtins.toJSON {
      log = {
        level = "warn";
        timestamp = true;
      };

      inbounds = [
        {
          type = "mixed";
          tag = "proxy-in";
          listen = "127.0.0.1";
          listen_port = 2080;
        }
      ];

      endpoints = [
        {
          type = "wireguard";
          tag = "warp";
          system = false; # userspace: без TUN и без root
          mtu = 1280;
          address = [ "172.16.0.2/32" ];
          private_key = "@@WARP_PRIVATE_KEY@@";
          peers = [
            {
              address = "162.159.192.1";
              port = 2408;
              public_key = "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=";
              allowed_ips = [
                "0.0.0.0/0"
                "::/0"
              ];
              reserved = [
                116
                216
                169
              ];
              persistent_keepalive_interval = 25;
            }
          ];
        }
      ];

      route.final = "warp";
    }
  );

  renderConfig = pkgs.writeShellApplication {
    name = "render-sing-box-config";
    runtimeInputs = [
      pkgs.jq
      pkgs.coreutils
    ];
    text = ''
      key_file="$HOME/.config/sing-box/warp.key"
      runtime_dir="$XDG_RUNTIME_DIR/sing-box"
      out="$runtime_dir/config.json"

      if [ ! -s "$key_file" ]; then
        printf '%s\n' "sing-box: отсутствует ключ $key_file" >&2
        printf '%s\n' "  создай:  umask 077; mkdir -p ~/.config/sing-box" >&2
        printf '%s\n' "            wg genkey | tr -d '\n' > $key_file" >&2
        exit 1
      fi

      install -d -m 700 "$runtime_dir"
      jq --rawfile k "$key_file" \
        '(.endpoints[0].private_key) |= ($k | rtrimstr("\n"))' \
        ${template} > "$out"
      chmod 600 "$out"

      ${lib.getExe pkgs.sing-box} check -c "$out"
    '';
  };
in
{
  home.packages = [
    pkgs.sing-box
    pkgs.wireguard-tools # wg genkey — генерация ключа
  ];

  home.file.".config/sing-box/config.template.json".source = template;

  # кавычки обязательны: без них Nix прочитает "sing-box" как путь sing.box.
  # Структура — секции systemd-юнита, как в Home Manager, а не как в NixOS.
  systemd.user.services."sing-box" = {
    Unit = {
      Description = "Local HTTP/SOCKS proxy through Cloudflare WARP";
      After = [ "network-online.target" ];
    };
    Service = {
      ExecStartPre = "${renderConfig}";
      ExecStart = "${lib.getExe pkgs.sing-box} run -c %t/sing-box/config.json";
      Restart = "on-failure";
      RestartSec = "3";
    };
  };
}
