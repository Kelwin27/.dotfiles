{ pkgs, ... }:
{
  treesitter = {
    enable = true;
    addDefaultGrammars = false;
    autotagHtml = true;
    fold = true;
    grammars = [
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.nix
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.python
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.go
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.typescript
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.javascript
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.lua
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.bash
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.markdown
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.json
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.yaml
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.html
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.css
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.c_sharp
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.typst
    ];

    context.enable = true;
    highlight.enable = true;
    indent.enable = true;
  };
}
