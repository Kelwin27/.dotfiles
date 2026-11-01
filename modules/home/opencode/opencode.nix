{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  inherit (pkgs.stdenv.hostPlatform) system;

  mcp-nixos = inputs.mcp-nixos.packages.${system}.default;
  serena = inputs.serena.packages.${system}.default;

  # oc-init: кладёт в текущий каталог opencode.jsonc и AGENTS.md. Существующие не трогает.
  oc-init = pkgs.writeShellScriptBin "oc-init" ''
    set -eu
    copy() {
      if [ -e "$2" ]; then
        echo "skip:    $2 уже существует"
      else
        install -m644 "$1" "$2"
        echo "created: $2"
      fi
    }
    copy ${./project-template/opencode.jsonc} opencode.jsonc
    copy ${./project-template/AGENTS.md} AGENTS.md
  '';

  # В opencode побеждает ПОСЛЕДНЕЕ совпавшее правило, поэтому "*" обязан идти первым.
  askAfterCatchAll = lib.hm.dag.entryAfter [ "*" ] "ask";
in
{
  programs.opencode = {
    enable = true;

    # ~/.config/opencode/AGENTS.md
    context = ./AGENTS.md;

    # Проверка итогового opencode.json по схеме при сборке.
    validateFiles.config = false;

    settings = {
      autoupdate = false;

      plugins = [
        "superpowers@git+https://github.com/obra/superpowers.git"
        "@cortexkit/opencode-magic-context@latest"
      ];

      # Magic Context сам управляет контекстом, встроенное сжатие выключаем.
      compaction = {
        auto = false;
        prune = false;
      };

      lsp = { };

      permission.bash = {
        "*" = "allow";
        "rm *" = askAfterCatchAll;
        "sudo *" = askAfterCatchAll;
        "git push *" = askAfterCatchAll;
        "git reset --hard*" = askAfterCatchAll;
        "git clean *" = askAfterCatchAll;
        "nh os *" = askAfterCatchAll;
        "nixos-rebuild *" = askAfterCatchAll;
        "nix-collect-garbage*" = askAfterCatchAll;
        "nh clean *" = askAfterCatchAll;
      };

      mcp = {
        # Актуальная документация библиотек. Ключ необязателен (даёт лимиты выше).
        servers = {
          context7 = {
            type = "remote";
            url = "https://mcp.context7.com/mcp";
            enabled = true;
            # headers.CONTEXT7_API_KEY = "{env:CONTEXT7_API_KEY}";
          };
        };

        # Справочник по пакетам и опциям NixOS / Home Manager.
        nixos = {
          type = "local";
          command = [ (lib.getExe mcp-nixos) ];
          enabled = true;
        };

        # Go: включается в проекте через opencode.jsonc.
        gopls = {
          type = "local";
          command = [
            "gopls"
            "mcp"
          ];
          enabled = false;
        };

        # Символьная навигация и правки. Включать в больших репозиториях.
        serena = {
          type = "local";
          command = [
            (lib.getExe serena)
            "start-mcp-server"
            "--context"
            "ide"
            "--project-from-cwd"
          ];
          enabled = false;
        };
      };
    };
  };

  home.packages = [ oc-init ];
}
