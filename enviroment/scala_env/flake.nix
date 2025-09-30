{
  description = "Modern Scala (nixpkgs packages) + JDK 21";

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
          jdk
          scala
          sbt
          metals
          scalafmt
          scalafix
          ammonite # REPL
          scala-cli
          coursier
        ];

        shellHook = ''
          export JAVA_HOME=${pkgs.jdk}
          export PATH=$JAVA_HOME/bin:$PATH

          echo "🚀 Modern Scala environment ready! (Using nixpkgs packages)"
          echo "   All tools from Nix - no local cache needed."
          echo ""

          # Простая проверка версий
          echo "📋 Tools:"
          if command -v scala >/dev/null 2>&1; then
            echo "   Scala: $(scala -version 2>&1 | head -n1)"
          else
            echo "   Scala: ❌ NOT FOUND"
          fi

          if command -v sbt >/dev/null 2>&1; then
            echo "   SBT: $(sbt --version 2>&1 | head -n1)"
          else
            echo "   SBT: ❌ NOT FOUND"
          fi

          if command -v metals >/dev/null 2>&1; then
            METALS_OUTPUT=$(metals --version 2>&1)
            METALS_VERSION=$(echo "$METALS_OUTPUT" | grep -E '^metals [0-9]+\.[0-9]+\.[0-9]+' | cut -d' ' -f2)
            if [ -n "$METALS_VERSION" ]; then
              echo "   Metals: $METALS_VERSION"
            else
              echo "   Metals: Version not found in output"
            fi
          else
            echo "   Metals: ❌ NOT FOUND"
          fi

          if command -v scalafmt >/dev/null 2>&1; then
            echo "   Scalafmt: $(scalafmt --version 2>&1 | head -n1)"
          else
            echo "   Scalafmt: ❌ NOT FOUND"
          fi

          if command -v scalafix >/dev/null 2>&1; then
            echo "   Scalafix: $(scalafix --version 2>&1 | head -n1)"
          else
            echo "   Scalafix: ❌ NOT FOUND"
          fi

          echo "   Java: $(java -version 2>&1 | head -n1)"
          echo ""

          echo "💡 Quick start:"
          echo "   scala-cli new scala/scala3.g8 my-app"
          echo "   cd my-app && sbt compile"
          echo "   scalafmt --help  # format"
          echo "   scalafix --help  # lint"
          echo ""

          if [ -n "$ZSH_VERSION" ]; then
            echo "🐚 zsh activated!"
          fi
        '';
      };
    };
}
