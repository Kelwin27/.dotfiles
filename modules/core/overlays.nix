# Temporary: nixpkgs 7fd4004 (nixos-unstable tip, 2026-10-11) carries a stale
# pnpm hash for typescript-language-server 6.0.2, so every build that pulls the
# nvf typescript LSP fails with "hash mismatch in fixed-output derivation".
# Upstream fixed it in NixOS/nixpkgs ac7b1aaed03d, which is not backported to
# nixos-unstable yet. Drop this file and its import once
# `nix flake update nixpkgs` brings that commit in.
{ ... }:
{
  nixpkgs.overlays = [
    (
      final: prev: {
        typescript-language-server =
          prev.typescript-language-server.overrideAttrs (
            old: {
              pnpmDeps = old.pnpmDeps.overrideAttrs (_: {
                outputHash = "sha256-xR/EF60lVBsITKgH7wCM2wHM46PFQevD51KfCENSUH4=";
              });
            }
          );
      }
    )
  ];
}