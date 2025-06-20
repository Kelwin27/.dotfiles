{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      c = "clear";
      v = "nvim";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      nano = "micro";
      code = "codium";
      diff = "delta --diff-so-fancy --side-by-side";
      less = "bat";
      f = "superfile";
      py = "python";
      dsize = "du -hs";
      pdf = "tdf";
      open = "xdg-open";
      space = "ncdu";
      man = "BAT_THEME='default' batman";
      upgrade = "sudo nixos-rebuild switch --flake $HOME/nixos-config";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";
      la = "ls -la";

      # Nixos
      cdnix = "cd ~/nixos-config && codium ~/nixos-config";
      ns = "nom-shell --run zsh";
      nd = "nom develop --command zsh";
      nb = "nom build";
      nc = "nh clean all --keep 5";
      nft = "nh os test";
      nfs = "nh os switch";
      nfu = "nh os switch --update";
      # nix-search = "nh search";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";
      
      # Garbage
      sugc = "sudo nix-collect-garbage -d";
      cg = "nix-collect-garbage -d";
      sugc-list = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      cg-list = "nix-env --list-generations";
    };
  };
}
