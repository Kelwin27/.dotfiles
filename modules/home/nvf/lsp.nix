{ lib, ... }:
{
  lsp = {
    enable = true;
    formatOnSave = true;

    lightbulb.enable = false;
    lspconfig.enable = true;
    nvim-docs-view.enable = true;
    trouble.enable = true;
    servers = {
      omnisharp = {
        enable = true;

        cmd = lib.mkForce [
          "OmniSharp"
          "--languageserver"
          "--stdio"
        ];

        filetypes = [
          "cs"
          "csharp"
          "csproj"
          "sln"
        ];

        root_dir = ''
          local util = require'lspconfig.util'
          return util.root_pattern('*.sln', '*.csproj', '.git')(filename)
              or vim.fn.getcwd()
        '';
      };
    };
  };
}
