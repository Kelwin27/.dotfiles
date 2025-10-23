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
      man = "batman";
      upgrade = "sudo nixos-rebuild switch --flake $HOME/nixos-config";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long --total-size";
      tree = "eza --icons --tree --group-directories-first";
      la = "ls -la";

      # Nixos
      cdnix = "cd ~/nixos-config && codium ~/nixos-config";
      ns = "nom-shell --run zsh";
      nd = "nom develop --command zsh";
      nb = "nom build";
      nhc = "nh clean all";
      nht = "nh os test";
      nhs = "nh os switch";
      nhu = "nh os switch --update";
      # nix-search = "nh search";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      # Garbage
      sucg = "sudo nix-collect-garbage -d";
      cg = "nix-collect-garbage -d";
      sucg-list = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      cg-list = "nix-env --list-generations";

      # DPI
      dpi = "py ~/NoDPI/src/main.py --blacklist ~/NoDPI/blacklist.txt";

      # Scala flakes
      scala2 = "cd ~/nixos-config/enviroment/scala_legacy_env/ && nix develop --command zsh";
      scala3 = "cd ~/nixos-config/enviroment/scala_env/ && nix develop --command zsh";

      # Angular + nodejs
      web = "cd ~/nixos-config/enviroment/web_env/ && nix develop --command zsh";

      # C#
      csharp = "cd ~/nixos-config/enviroment/csharp_env/ && nix develop --command zsh";
    };
  };
}
