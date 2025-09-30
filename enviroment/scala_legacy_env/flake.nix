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

          # Директория для локальной установки
          SCALA_LOCAL_DIR="$HOME/.cache/scala-env"
          mkdir -p "$SCALA_LOCAL_DIR"

          echo "🔨 Setting up Scala environment..."

          # Устанавливаем Scala 2.12.10
          if [ ! -f "$SCALA_LOCAL_DIR/scala" ]; then
            echo "   Installing Scala 2.12.10..."
            cs install scala:2.12.10 --dir "$SCALA_LOCAL_DIR" --force
            if [ -f "$SCALA_LOCAL_DIR/scala" ]; then
              echo "     ✓ Scala installed"
            else
              echo "     ⚠ Failed to install Scala"
            fi
          fi

          # Устанавливаем SBT 1.3.3
          if [ ! -f "$SCALA_LOCAL_DIR/sbt" ]; then
            echo "   Installing SBT 1.3.3..."
            cs install sbt:1.3.3 --dir "$SCALA_LOCAL_DIR" --force
            if [ -f "$SCALA_LOCAL_DIR/sbt" ]; then
              echo "     ✓ SBT installed"
            else
              echo "     ⚠ Failed to install SBT"
            fi
          fi

          # Устанавливаем Metals 0.9.8
          if [ ! -f "$SCALA_LOCAL_DIR/metals" ]; then
            echo "   Installing legacy Metals 0.9.8..."
            cs install metals:0.9.8 --dir "$SCALA_LOCAL_DIR" --force
            if [ -f "$SCALA_LOCAL_DIR/metals" ]; then
              echo "     ✓ Metals installed"
            else
              echo "     ⚠ Failed to install Metals"
            fi
          fi

          # Обновляем PATH (добавляем корневую директорию SCALA_LOCAL_DIR)
          if [ -d "$SCALA_LOCAL_DIR" ]; then
            export PATH="$SCALA_LOCAL_DIR:$PATH"
          fi

          # Создаем временную директорию для проверки
          TEMP_CHECK_DIR="/tmp/scala-check-$$"
          mkdir -p "$TEMP_CHECK_DIR"

          echo "🛠️ Scala environment ready!"
          echo "   Install dir: $SCALA_LOCAL_DIR"
          echo "   PATH updated: $SCALA_LOCAL_DIR"
          echo ""

          # Проверяем каждый инструмент
          if command -v scala >/dev/null 2>&1; then
            echo "   Scala: $(scala -version 2>&1 | head -n1)"
          else
            echo "   Scala: ❌ NOT FOUND"
            echo "     Check: ls -la $SCALA_LOCAL_DIR/scala"
          fi

          if command -v sbt >/dev/null 2>&1; then
            echo "   SBT:   $(sbt --version 2>&1 | head -n1)"
          else
            echo "   SBT:   ❌ NOT FOUND"
            echo "     Check: ls -la $SCALA_LOCAL_DIR/sbt"
          fi

          if command -v metals >/dev/null 2>&1; then
            echo "   Metals: $(metals --version 2>&1 | head -n1)"
          else
            echo "   Metals: ❌ NOT FOUND"
            echo "     Check: ls -la $SCALA_LOCAL_DIR/metals"
            echo "     Debug: find $SCALA_LOCAL_DIR -name '*metals*'"
          fi

          echo "   Java:  $(${pkgs.jdk11}/bin/java -version 2>&1 | head -n1)"
          echo ""
          echo "💡 To clean up: rm -rf $SCALA_LOCAL_DIR"
          echo "💡 Debug info:"
          echo "   which scala: $(which scala 2>/dev/null || echo 'not found')"
          echo "   which sbt:   $(which sbt 2>/dev/null || echo 'not found')"
          echo "   which metals: $(which metals 2>/dev/null || echo 'not found')"
          echo "   PATH contains: $(echo $PATH | tr ':' '\n' | grep -E '(scala-env|bin)' | head -2)"
          echo ""
        '';
      };
    };
}
