{ ... }:
{
  imports = [
    ./audacious.nix # music player
    ./bat.nix # better cat command
    ./browser.nix # zen browser + chromium
    ./btop.nix # resouces monitor
    ./cava.nix # audio visualizer
    ./fastfetch/fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./ghostty.nix # terminal
    ./git.nix # version control
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./lazygit.nix
    ./messengers.nix # vebcord, tg
    #./ollama.nix # ollama ai
    ./noctalia # desktop shell (bar, notifications, launcher, lock, wallpaper)
    ./obsidian.nix
    ./opencode # ai agent
    ./p10k/p10k.nix
    ./packages # other packages
    ./poweralertd.nix # battery notifications, laptop only
    ./scripts/scripts.nix # personal scripts
    ./ssh.nix # ssh config
    ./vscodium # vscode fork
    ./yazi # terminal file manager
    ./xdg-mimes.nix # xdg config
    ./zsh # shell
  ];
}
