{
  description = "Minimal Frontend (Angular CLI) environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          # Основные инструменты
          nodePackages_latest."@angular/cli"

          # Базовые утилиты
          git
          curl
        ];

        shellHook = ''
          export NODE_ENV=development
          if [ -d "$PWD/node_modules/.bin" ]; then
            export PATH="$PWD/node_modules/.bin:$PATH"
          else
            echo "⚠️ node_modules/.bin not found in $PWD"
            echo "   Please run 'npm install' in your project directory"
          fi

          if ! command -v node >/dev/null 2>&1; then
            echo "❌ Node.js not found! Please install Node.js globally."
            echo "   Or add nodejs_20 to buildInputs in flake.nix"
            exit 1
          fi

          # Проверка Angular CLI
          if ! command -v ng >/dev/null 2>&1; then
            echo "❌ Angular CLI not available!"
            exit 1
          fi

          echo "🌐 Minimal Frontend environment ready! (Angular CLI)"
          echo "   Using global Node.js + Angular CLI from Nix"
          echo "   Other tools as project dependencies via npm"
          echo ""

          # Проверка версий
          echo "📋 Core Tools:"
          echo "   Angular CLI: $(ng version 2>&1 | head -n1)"
          echo "   Node.js: $(node --version)"
          echo "   NPM:     $(npm --version 2>/dev/null || echo 'Not found')"
          echo ""

          echo "🚀 Quick start:"
          echo ""
          echo "   # Создать новый Angular проект"
          echo "   ng new my-app --routing --style=scss"
          echo "   cd my-app"
          echo "   npm install"
          echo ""
          echo "   # Добавить зависимости в проект"
          echo "   npm add typescript @types/node"
          echo "   npm add -D vite prettier eslint"
          echo ""
          echo "   # Запуск dev сервера"
          echo "   ng serve"
          echo ""
          echo "   # Сборка и тесты"
          echo "   ng build"
          echo "   ng test"
          echo "   ng lint"
          echo ""

          if [ -n "$ZSH_VERSION" ]; then
            echo "🐚 zsh activated!"
          fi
        '';
      };
    };
}
