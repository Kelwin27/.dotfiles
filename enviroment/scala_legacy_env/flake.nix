{
  description = "Scala 2.12.10 + SBT 1.3.3 + JDK 11 (modern nixpkgs)";

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
          jdk11
          scala-cli
          coursier
        ];

        shellHook = ''
          export JAVA_HOME=${pkgs.jdk11}
          export PATH=$JAVA_HOME/bin:$PATH

          # Директория для локальной установки (создаем bin)
          SCALA_LOCAL_DIR="$HOME/.cache/scala-env"
          mkdir -p "$SCALA_LOCAL_DIR/bin"

          echo "🔨 Setting up Scala environment..."

          # Устанавливаем Scala 2.12.10
          if [ ! -f "$SCALA_LOCAL_DIR/bin/scala" ]; then
            echo "   Installing Scala 2.12.10..."
            # Устанавливаем в текущую директорию и перемещаем в bin
            cs install scala:2.12.10 --force --dir "$SCALA_LOCAL_DIR"
            # Находим установленный scala и перемещаем в bin
            find "$SCALA_LOCAL_DIR" -name "scala" -type f -executable | head -1 | xargs -I {} mv {} "$SCALA_LOCAL_DIR/bin/scala" 2>/dev/null || true
          fi

          # Устанавливаем SBT 1.3.3
          if [ ! -f "$SCALA_LOCAL_DIR/bin/sbt" ]; then
            echo "   Installing SBT 1.3.3..."
            cs install sbt:1.3.3 --force --dir "$SCALA_LOCAL_DIR"
            # Находим установленный sbt и перемещаем в bin
            find "$SCALA_LOCAL_DIR" -name "sbt" -type f -executable | head -1 | xargs -I {} mv {} "$SCALA_LOCAL_DIR/bin/sbt" 2>/dev/null || true
          fi

          # Устанавливаем Metals (правильные Maven координаты)
          if [ ! -f "$SCALA_LOCAL_DIR/bin/metals" ]; then
            echo "   Installing legacy Metals 0.9.8..."
            # Правильная команда для Metals 0.9.8
            cs install --force org.scalameta.metals:metals_2_12:0.9.8 --dir "$SCALA_LOCAL_DIR"
            # Находим установленный metals и перемещаем в bin
            find "$SCALA_LOCAL_DIR" -name "metals*" -type f -executable | head -1 | xargs -I {} mv {} "$SCALA_LOCAL_DIR/bin/metals" 2>/dev/null || true
          fi

          # Обновляем PATH (именно bin директория)
          if [ -d "$SCALA_LOCAL_DIR/bin" ]; then
            export PATH="$SCALA_LOCAL_DIR/bin:$PATH"
          fi

          # Создаем временную директорию для проверки
          TEMP_CHECK_DIR="/tmp/scala-check-$$"
          mkdir -p "$TEMP_CHECK_DIR"

          echo "🛠️  Scala environment ready!"
          echo "   Install dir: $SCALA_LOCAL_DIR"
          echo "   PATH updated: $SCALA_LOCAL_DIR/bin"
          echo ""

          # Проверяем каждый инструмент
          if command -v scala >/dev/null 2>&1; then
            echo "   Scala: $(scala -version 2>&1 | head -n1)"
          else
            echo "   Scala: ❌ NOT FOUND"
            echo "     Check: ls -la $SCALA_LOCAL_DIR/bin/scala"
          fi

          if command -v sbt >/dev/null 2>&1; then
            echo "   SBT:   $(sbt --version 2>&1 | head -n1)"
          else
            echo "   SBT:   ❌ NOT FOUND"
            echo "     Check: ls -la $SCALA_LOCAL_DIR/bin/sbt"
          fi

          if command -v metals >/dev/null 2>&1; then
            echo "   Metals: $(metals --version 2>&1 | head -n1)"
          else
            echo "   Metals: ❌ NOT FOUND"
          fi

          echo "   Java:  $(${pkgs.jdk11}/bin/java -version 2>&1 | head -n1)"
          echo ""
          echo "💡 To clean up: rm -rf $SCALA_LOCAL_DIR"
          echo "💡 Debug info:"
          echo "   which scala: $(which scala 2>/dev/null || echo 'not found')"
          echo "   which sbt:   $(which sbt 2>/dev/null || echo 'not found')"
          echo "   PATH contains: $(echo $PATH | tr ':' '\n' | grep -E "(scala-env|bin)" | head -2)"
        '';
      };
    };
}
