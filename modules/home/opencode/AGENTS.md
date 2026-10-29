# Global rules

- Reply in the user's language; keep code, commands and identifiers in English.
- Search before reading: use `rg` / `fd`; for structural search or refactors use `ast-grep`, not regex replace.
- Large files (over ~500 lines): find the lines with a search, then read only that range. Do not re-read a section without changes in between.
- Save long command output to a file once and analyse the file instead of re-running the command.
- When a library or API may have changed since training, call the `context7` MCP tools before writing code against it.
