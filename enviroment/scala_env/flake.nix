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
          jdk21
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
          export JAVA_HOME=${pkgs.jdk21}
          export PATH=$JAVA_HOME/bin:$PATH

          echo "🚀 Modern Scala environment ready! (Using nixpkgs packages)"
          echo "   All tools from Nix - no local cache needed."
          echo ""

          # Простая проверка версий
          echo "📋 Tools:"
          command -v scala && echo "   Scala: $(scala -version 2>&1 | head -n1)"
          command -v sbt && echo "   SBT:   $(sbt --version 2>&1 | head -n1)"
          command -v metals && echo "   Metals: $(metals --version 2>&1 | head -n1)"
          command -v scalafmt && echo "   Scalafmt: $(scalafmt --version 2>&1 | head -n1)"
          command -v scalafix && echo "   Scalafix: $(scalafix --version 2>&1 | head -n1)"
          echo "   Java:  ${pkgs.jdk21}/bin/java -version 2>&1 | head -n1)"
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
