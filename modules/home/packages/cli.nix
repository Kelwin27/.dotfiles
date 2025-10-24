{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    duf # disk information
    eza # ls replacement
    fd # find replacement
    gping # ping with a graph
    gtrash # rm replacement, put deleted files in system trash
    hexyl # hex viewer
    man-pages # extra man pages
    ncdu # disk space
    ripgrep # grep replacement
    tldr

    ## Tools / useful cli
    asciinema
    asciinema-agg
    binsider
    gopass # cli for secure manage passwords
    bitwise # cli tool for bit / hex manipulation
    broot # tree files view
    caligula # User-friendly, lightweight TUI for disk imaging
    hyperfine # benchmarking tool
    pastel # cli to manipulate colors
    swappy # snapshot editing tool
    tdf # cli pdf viewer
    tokei # project line counter
    translate-shell # cli translator
    woomer
    yt-dlp-light

    ## TUI
    epy # ebook reader
    gtt # google translate TUI
    programmer-calculator
    toipe # typing test in the terminal
    ttyper # cli typing test

    ## Monitoring
    onefetch # fetch utility for git repo
    tcpdump # network packet analyzer/sniffer
    nmap # network discovery and security scanner
    # wavemon                           # monitoring for wireless network devices

    ## Fun / screensaver
    asciiquarium-transparent
    cbonsai
    cmatrix
    countryfetch
    cowsay
    figlet
    fortune
    lavat
    lolcat
    pipes
    sl
    tty-clock

    ## Multimedia
    imv
    lowfi
    mpv

    ## Utilities
    entr # perform action when file change
    ffmpeg
    file # Show file information
    jq # JSON processor
    killall
    libnotify
    mimeo
    openssl
    playerctl # controller for media players
    poweralertd
    unzip
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils
  ];
}
