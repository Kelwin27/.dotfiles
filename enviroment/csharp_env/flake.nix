{
  description = "Minimal C# development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
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
          dotnet-sdk_10 # SDK для .NET (включает компилятор C# и runtime)
          csharp-ls # LSP-сервер для C#
          csharpier # Форматировщик кода для C#
          libgdiplus # delete
        ];

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          pkgs.libgdiplus
        ];

        shellHook = ''
          export DOTNET_ROOT="${pkgs.dotnet-sdk_10}/bin"
          export PATH="$DOTNET_ROOT:$PATH"

          # Добавляем локальные бинарники проекта (если есть)
          if [ -d "$PWD/.dotnet/tools" ]; then
            export PATH="$PWD/.dotnet/tools:$PATH"
            echo "✅ Project .dotnet/tools added to PATH"
          else
            echo "⚠️  .dotnet/tools not found in $PWD"
            echo "   Run 'dotnet tool install' to add project-specific tools"
          fi

          # Проверка .NET SDK
          if ! command -v dotnet >/dev/null 2>&1; then
            echo "❌ .NET SDK not available!"
            exit 1
          fi

          echo "🖥️  Minimal C# development environment ready!"
          echo "   Using global .NET SDK, OmniSharp, netcoredbg, and CSharpier from Nix"
          echo ""

          # Проверка версий
          echo "📋 Core Tools:"
          echo "   .NET SDK: $(dotnet --version)"
          echo "   OmniSharp: $(omnisharp --version 2>/dev/null || echo 'Not found')"
          echo "   CSharpier: $(csharpier --version 2>/dev/null || echo 'Not found')"
          echo ""

          echo "🚀 Quick start:"
          echo ""
          echo "   dotnet new console -n MyApp"
          echo "   cd MyApp"
          echo ""
          echo "   # Добавить зависимости в проект"
          echo "   dotnet add package Newtonsoft.Json"
          echo "   dotnet add package Microsoft.EntityFrameworkCore"
          echo ""
          echo "   # Запуск проекта"
          echo "   dotnet run"
          echo ""
          echo "   # Сборка и тестирование"
          echo "   dotnet build"
          echo "   dotnet test"
          echo ""
          echo "   # Форматирование кода с CSharpier"
          echo "   csharpier ."
          echo ""

          if [ -n "$ZSH_VERSION" ]; then
            echo "🐚 zsh activated!"
          fi
        '';
      };
    };
}
