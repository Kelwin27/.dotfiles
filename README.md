<h1 align="center">
   <img src="./.github/assets/logo/nixos-logo.png  " width="100px" /> 
   <br>
      Modified Copy of Frost-Phoenix's NixOS Config 
   <br>
      <img src="./.github/assets/pallet/pallet-0.png" width="600px" /> <br>

   <div align="center">
      <p></p>
      <div align="center">
         <a href="https://github.com/Kelwin27/.dotfiles/stargazers">
            <img src="https://img.shields.io/github/stars/Kelwin27/.dotfiles?color=FABD2F&labelColor=282828&style=for-the-badge&logo=starship&logoColor=FABD2F">
         </a>
         <a href="https://github.com/Kelwin27/.dotfiles/">
            <img src="https://img.shields.io/github/repo-size/Kelwin27/.dotfiles?color=B16286&labelColor=282828&style=for-the-badge&logo=github&logoColor=B16286">
         </a>
         <a href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=282828&logo=NixOS&logoColor=458588&color=458588">
         </a>
         <a href="https://github.com/Kelwin27/.dotfiles/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=282828&colorB=98971A&logo=unlicense&logoColor=98971A&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

### 🖼️ Gallery

<p align="center">
   <img width="1920" height="1080" alt="Screenshot_2026_10_12_at_22h16m34s-region" src="https://github.com/user-attachments/assets/9490d4a1-adc8-4671-8966-488e5693d5cc"  style="margin-bottom: 15px;"/><br>
   <img width="1920" height="1080" alt="Screenshot_2026_10_12_at_22h13m58s-region" src="https://github.com/user-attachments/assets/7dc8c1e3-89fd-4747-9363-b8229c24b731" style="margin-bottom: 15px;" /><br>
   <img width="1920" height="1080" alt="Screenshot_2026_10_12_at_22h17m41s-region" src="https://github.com/user-attachments/assets/77c36663-da2d-4546-98df-fe38cc071399" style="margin-bottom: 15px;"/><br>
   <img width="1920" height="1080" alt="Screenshot_2026_10_12_at_22h22m57s-region" src="https://github.com/user-attachments/assets/a2a196e1-549b-4619-a9aa-f2e60a93bf05" style="margin-bottom: 15px;"/><br>
</p>
</details>

# 🗃️ Overview

## 📚 Layout

-   [flake.nix](flake.nix) base of the configuration
-   [hosts](hosts) 🌳 per-host configurations that contain machine specific configurations
    - [desktop](hosts/desktop/) 🖥️ Desktop specific configuration
    - [laptop](hosts/laptop/) 💻 Laptop specific configuration
    - [vm](hosts/vm/) 🗄️ VM specific configuration
-   [modules](modules) 🍱 modularized NixOS configurations
    -   [core](modules/core/) ⚙️ Core NixOS configuration
    -   [home](modules/home/) 🏠 my [Home-Manager](https://github.com/nix-community/home-manager) config
-   [wallpapers](wallpapers/) 🌄 wallpapers collection

## 📓 Components

Bar, launcher, notifications, lock screen, wallpaper picker, OSD and clipboard all come from a single Noctalia shell.

|                             | NixOS + Hyprland                                                                              |
| --------------------------- | :---------------------------------------------------------------------------------------------:
| **Window Manager**          | [Hyprland][Hyprland] |
| **Desktop Shell**           | [Noctalia][Noctalia] (bar, launcher, notifications, lock, wallpaper, OSD, clipboard) |
| **Terminal Emulator**       | [Ghostty][Ghostty] |
| **Shell**                   | [zsh][zsh] + [powerlevel10k][powerlevel10k] |
| **Text Editor**             | [VSCodium][VSCodium] + [Neovim][Neovim] |
| **Browser**                 | [Zen Browser][Zen Browser] + Chromium |
| **Network Management**      | [NetworkManager][NetworkManager] |
| **System Resource Monitor** | [Btop][Btop] + nvtop |
| **File Manager**            | [yazi][yazi] |
| **Fonts**                   | [Maple Mono][Maple Mono] |
| **Color Scheme**            | [Catppuccin Macchiato][Catppuccin] |
| **GTK Theme**               | [Catppuccin gtk theme][Catppuccin gtk theme] |
| **Cursor**                  | [Bibata-Modern-Ice][Bibata-Modern-Ice] |
| **Icons**                   | [Papirus-Dark][Papirus-Dark] |
| **Image Viewer**            | [imv][imv] |
| **Media Player**            | [mpv][mpv] |
| **Music Player**            | [audacious][audacious] |
| **Audio Visualizer**        | [cava][cava] |
| **Screen Recording**        | [wf-recorder][wf-recorder] |
| **Color Picker**            | [hyprpicker][hyprpicker] |


## 📝 Shell aliases

<details>
<summary>
Utils (EXPAND)
</summary>

- ```c```     $\rightarrow$ ```clear```
- ```v```     $\rightarrow$ ```nvim```
- ```cd```    $\rightarrow$ ```z```
- ```tt```    $\rightarrow$ ```gtrash put```
- ```cat```   $\rightarrow$ ```bat```
- ```code```  $\rightarrow$ ```codium```
- ```diff```  $\rightarrow$ ```delta --diff-so-fancy --side-by-side```
- ```less```  $\rightarrow$ ```bat```
- ```f```     $\rightarrow$ ```yazi```
- ```py```    $\rightarrow$ ```python```
- ```dsize``` $\rightarrow$ ```du -hs```
- ```pdf```   $\rightarrow$ ```tdf```
- ```open```  $\rightarrow$ ```xdg-open```
- ```space``` $\rightarrow$ ```ncdu```
- ```man```   $\rightarrow$ ```batman```
- ```l```     $\rightarrow$ ```eza --icons  -a --group-directories-first -1```
- ```ll```    $\rightarrow$ ```eza --icons  -a --group-directories-first -1 --no-user --long --total-size```
- ```la```    $\rightarrow$ ```ls -la```
- ```tree```  $\rightarrow$ ```eza --icons --tree --group-directories-first```
- ```clean-vesktop``` $\rightarrow$ ```rm -rf ~/.config/vesktop/sessionData/{Cache,Code Cache,GPUCache}```
</details>

<details>
<summary>
Nixos (EXPAND)
</summary>

- ```cdnix``` $\rightarrow$ ```cd ~/nixos-config && codium ~/nixos-config```
- ```ns```    $\rightarrow$ ```nom-shell --run zsh```
- ```nd```    $\rightarrow$ ```nom develop --command zsh```
- ```nb```    $\rightarrow$ ```nom build```
- ```nhc```   $\rightarrow$ ```nh clean all```
- ```nht```   $\rightarrow$ ```nh os test```
- ```nhs```   $\rightarrow$ ```nh os switch```
- ```nhu```   $\rightarrow$ ```nh os switch --update```
</details>

<details>
<summary>
Python (EXPAND)
</summary>

- ```piv``` $\rightarrow$ ```python -m venv .venv```
- ```psv``` $\rightarrow$ ```source .venv/bin/activate```
</details>

## 🛠️ Scripts

All the scripts are in ```modules/home/scripts/scripts/``` and are auto-exported as packages by ```modules/home/scripts/scripts.nix``` — each ```*.sh``` becomes a command named after the file with the extension stripped.

<details>
<summary>
extract.sh 
</summary>

**Description:** This script extracts ```tar.gz``` archives in the current directory.

**Usage:** ```extract <archive_file>```
</details>

<details>
<summary>
compress.sh 
</summary>

**Description:** This script compresses a file or a folder into a ```tar.gz``` archive which is created in the current directory with the name of the chosen file or folder. 

**Usage:** ```compress <file>``` or ```compress <folder>```
</details>

<details>
<summary>
toggle-blur.sh 
</summary>

**Description:** This script toggles the Hyprland blur effect. If the blur is currently enabled, it will be disabled, and if it's disabled, it will be turned on. 

**Usage:** ```toggle-blur```
</details>

<details>
<summary>
toggle-opacity.sh 
</summary>

**Description:** This script toggles the Hyprland opacity effect. If the opacity is currently set to 0.90, it will be set to 1, and if it's set to 1, it will be set to 0.90. 

**Usage:** ```toggle-opacity```
</details>

<details>
<summary>
toggle-float.sh 
</summary>

**Description:** This script floats the focused window, resizes it to 1111x700 and centers it.

**Usage:** ```toggle-float```
</details>

<details>
<summary>
show-keybinds.sh 
</summary>

**Description:** This script opens the keybind list. Noctalia has no generic overlay, so the list is rendered as a small floating zenity window.

**Usage:** ```show-keybinds```
</details>

<details>
<summary>
record.sh 
</summary>

**Description:** This script records the screen and converts the result to an optimised ```.gif```.

**Usage:** ```record```
</details>

<details>
<summary>
lofi.sh 
</summary>

**Description:** This script toggles a lofi video stream. If mpv is already running, it is killed, otherwise the stream is started.

**Usage:** ```lofi```
</details>

<details>
<summary>
ascii.sh 
</summary>

**Description:** This script prints a colourised ASCII table of control characters with their decimal, hex and character forms.

**Usage:** ```ascii```
</details>

<details>
<summary>
maxfetch.sh 
</summary>

**Description:** This script is a modified version of the [jobcmax/maxfetch][maxfetch] script.

**Usage:** ```maxfetch```
</details>

<details>
<summary>
music.sh 
</summary>

**Description:** This script is for managing Audacious (music player). If Audacious is currently running, it will be killed (stopping the music); otherwise, it will start Audacious in the 5th workspace and resume the music. 

**Usage:** ```music```
</details>

<details>
<summary>
runbg.sh 
</summary>

**Description:** This script runs a provided command along with its arguments and detaches it from the terminal. Handy for launching apps from the command line without blocking it. 

**Usage:** ```runbg <command> <arg1> <arg2> <...>```
</details>

## ⌨️ Keybinds

View all keybinds by pressing ```$mainMod F1``` and wallpaper picker by pressing ```$mainMod, W```. By default ```$mainMod``` is the ```SUPER``` key. 

<details>
<summary>
Keybindings 
</summary>

##### show keybinds list
- ```$mainMod, F1, exec, show-keybinds```

##### launcher and shell
- ```$mainMod, D, exec, noctalia msg panel-toggle launcher```
- ```$mainMod, Return, exec, ghostty```
- ```ALT, Return, exec, [float; size 1111 700] ghostty```
- ```$mainMod SHIFT, Return, exec, [fullscreen] ghostty```

##### file manager
- ```$mainMod, E, exec, ghostty --title=files -e yazi```
- ```ALT, E, exec, [float; size 1111 700] ghostty --title=files -e yazi```

##### browser and editor
- ```$mainMod, B, exec, zen-beta```
- ```$mainMod SHIFT, B, exec, chromium```
- ```$mainMod SHIFT, V, exec, codium```

##### window management
- ```$mainMod, Q, killactive```
- ```$mainMod, F, fullscreen, 0```
- ```$mainMod SHIFT, F, fullscreen, 1```
- ```$mainMod, Space, exec, toggle-float```
- ```$mainMod, P, pseudo```
- ```$mainMod, X, layoutmsg, togglesplit```
- ```$mainMod, T, exec, toggle-opacity```
- ```$mainMod SHIFT, T, exec, noctalia msg bar-toggle```
- ```$mainMod, equal, exec, woomer```

##### noctalia panels
- ```$mainMod, Escape, exec, noctalia msg session lock```
- ```$mainMod SHIFT, Escape, exec, noctalia msg panel-toggle session```
- ```$mainMod, N, exec, noctalia msg panel-toggle notifications```
- ```$mainMod, V, exec, noctalia msg panel-toggle clipboard```
- ```$mainMod, W, exec, noctalia msg panel-toggle wallpaper```
- ```$mainMod SHIFT, W, exec, noctalia msg wallpaper-random```

##### other
- ```$mainMod, C, exec, hyprpicker -a```
- ```$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'```
- ```$mainMod SHIFT, D, exec, vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland```

##### system monitor
- ```$mainMod SHIFT, M, exec, toggle-resources```

##### screenshot
- ```,Print, exec, noctalia msg screenshot-region```

##### switch focus
- ```$mainMod, left/right/up/down```
- ```$mainMod, h/j/k/l```

##### raise focused window
- ```$mainMod, left/right/up/down```
- ```$mainMod, h/j/k/l```

##### float / tile the focused window
- ```CTRL ALT, up, exec, focuswindow floating```
- ```CTRL ALT, down, exec, focuswindow tiled```

##### switch workspace
- ```$mainMod, 1 … 0```

##### same as above, but switch to the workspace
- ```$mainMod SHIFT, 1 … 0```
- ```$mainMod CTRL, c, movetoworkspace, empty```

##### move window
- ```$mainMod SHIFT, left/right/up/down```
- ```$mainMod SHIFT, h/j/k/l```

##### resize active window
- ```$mainMod CTRL, left/right/up/down```
- ```$mainMod CTRL, h/j/k/l```

##### move active window freely
- ```$mainMod ALT, left/right/up/down```
- ```$mainMod ALT, h/j/k/l```

##### mouse
- ```$mainMod, mouse:272, movewindow```
- ```$mainMod, mouse:273, resizewindow```
- ```$mainMod, mouse_down, workspace, e-1```
- ```$mainMod, mouse_up, workspace, e+1```

##### media and volume controls
- ```,XF86AudioPlay, exec, playerctl play-pause```
- ```,XF86AudioNext, exec, playerctl next```
- ```,XF86AudioPrev, exec, playerctl previous```
- ```,XF86AudioStop, exec, playerctl stop```
- ```,XF86AudioMute, exec, noctalia msg volume-mute```
- ```,XF86AudioRaiseVolume, exec, noctalia msg volume-up```
- ```,XF86AudioLowerVolume, exec, noctalia msg volume-down```

##### brightness
- ```,XF86MonBrightnessUp, exec, noctalia msg brightness-up```
- ```,XF86MonBrightnessDown, exec, noctalia msg brightness-down```
</details>

# 🚀 Installation 

> [!CAUTION]
> Applying custom configurations, especially those related to your operating system, can have unexpected consequences and may interfere with your system's normal behavior. While I have tested these configurations on my own setup, there is no guarantee that they will work flawlessly for you.
> **I am not responsible for any issues that may arise from using this configuration.**

> [!NOTE]
> It is highly recommended to review the configuration contents and make necessary modifications to customize it to your needs before attempting the installation.

#### 1. **Install NixOS**

First install NixOS using any [graphical ISO image](https://nixos.org/download.html#nixos-iso). 
> [!NOTE]
> Only been tested using the GNOME graphical installer and choosing the ```No desktop``` option during installation.

#### 2. **Clone the repo**

```bash
nix-shell -p git
git clone https://github.com/Kelwin27/.dotfiles
cd .dotfiles
```

<!-- Links -->
[Hyprland]: https://github.com/hyprwm/Hyprland
[Noctalia]: https://github.com/noctalia-dev/noctalia
[Ghostty]: https://ghostty.org/
[powerlevel10k]: https://github.com/romkatv/powerlevel10k
[Btop]: https://github.com/aristocratos/btop
[yazi]: https://github.com/sxyazi/yazi
[zsh]: https://ohmyz.sh/
[audacious]: https://audacious-media-player.org/
[mpv]: https://github.com/mpv-player/mpv
[VSCodium]: https://vscodium.com/
[Neovim]: https://github.com/neovim/neovim
[imv]: https://sr.ht/~exec64/imv/
[cava]: https://github.com/karliss/cava
[Maple Mono]: https://github.com/subframe7536/maple-font
[NetworkManager]: https://wiki.gnome.org/Projects/NetworkManager
[wf-recorder]: https://github.com/ammen99/wf-recorder
[hyprpicker]: https://github.com/hyprwm/hyprpicker
[Catppuccin]: https://github.com/catppuccin/catppuccin
[Catppuccin gtk theme]: https://github.com/catppuccin/gtk
[Papirus-Dark]: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
[Bibata-Modern-Ice]: https://www.gnome-look.org/p/1197198
[maxfetch]: https://github.com/jobcmax/maxfetch
[Zen Browser]: https://zen-browser.app/
