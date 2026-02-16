{ ... }:
{
  imports = [
    ./audacious.nix # music player
    ./bat.nix # better cat command
    ./browser.nix # firefox based browser
    ./btop.nix # resouces monitor
    ./cava.nix # audio visualizer
    ./discord.nix # discord
    ./fastfetch/fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./ghostty.nix # terminal
    ./git.nix # version control
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./lazygit.nix
    ./micro.nix # nano replacement
    ./nemo.nix # file manager
    #./ollama.nix # ollama ai
    ./obsidian.nix
    ./p10k/p10k.nix
    ./packages # other packages
    ./rofi/rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./ssh.nix # ssh config
    ./superfile/superfile.nix # terminal file manager
    ./swaylock.nix # lock screen
    ./swayosd.nix # brightness / volume wiget
    ./swaync/swaync.nix # notification deamon
    ./vscodium # vscode fork
    ./waybar # status bar
    ./waypaper.nix # GUI wallpaper picker
    ./xdg-mimes.nix # xdg config
    ./zsh # shell
  ];
}
