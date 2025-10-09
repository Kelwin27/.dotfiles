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
          nodejs
          nodePackages_latest."@angular/cli"
          nodePackages."@tailwindcss/language-server"
          nodePackages.prettier
        ];

        shellHook = ''
          export NODE_ENV=development
          export PATH="${pkgs.nodejs}/bin:$PATH"

          # Добавляем локальные бинарники проекта
          if [ -d "$PWD/node_modules/.bin" ]; then
            export PATH="$PWD/node_modules/.bin:$PATH"
            echo "✅ Project node_modules/.bin added to PATH"
          else
            echo "⚠️  node_modules/.bin not found in $PWD"
            echo "   Run 'npm install' to install project dependencies"
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
