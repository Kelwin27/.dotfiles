# Global rules

## General
- Reply in the user's language; keep code, commands and identifiers in English.
- Prefer small, reviewable changes. Ask before destructive or irreversible actions.
- Search before reading: use `rg` / `fd`. For structural search or refactors use
  `ast-grep` (`sg run -p '<pattern>' -l <lang>`), not regex replace.
- Use `gh` for GitHub issues, PRs and CI instead of scraping web pages.
- If `serena` tools are available, prefer symbol-level navigation over reading whole files in large repos.

## Libraries and docs
- When a library or API may have changed since training, call the `context7` MCP tools
  before writing code against it.

## Nix / NixOS
- Never guess package names or option paths. Verify with the `nixos` MCP tools or `nix search nixpkgs <name>`.
- Prefer `programs.<name>` / `services.<name>` modules over `home.packages` / `environment.systemPackages` when a module exists.
- In flake repositories run `git add` for new files before building: untracked files are invisible to flakes.
- Validate with `nix flake check` or `nh os test`/`nixos-rebuild build`. Do not run `nh os switch`,
  `nixos-rebuild switch`, `nh clean`, `nix-collect-garbage`, or edit `flake.lock` by hand unless explicitly asked.
- Format with `treefmt` (nixfmt for Nix, shfmt for shell); lint shell with `shellcheck`.
