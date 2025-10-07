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
   <img src="./.github/assets/screenshots/1.png" style="margin-bottom: 15px;"/> <br>
   <img src="./.github/assets/screenshots/2.png" style="margin-bottom: 15px;"/> <br>
   <img src="./.github/assets/screenshots/3.png" style="margin-bottom: 15px;"/> <br>
   <img src="./.github/assets/screenshots/4.png" style="margin-bottom: 15px;"/> <br>
   <img src="./.github/assets/screenshots/5.png" style="margin-bottom: 15px;"/> <br>
   <img src="./.github/assets/screenshots/hyprlock.png" style="margin-bottom: 15px;" /> <br>
   Screenshots last updated <b>2025-10-07</b>
</p>

Here is my previous Catppuccin rice. You can find it [here](https://github.com/Frost-Phoenix/nixos-config/tree/catppuccin)
<details>
<summary>
Catppuccin (EXPAND)
</summary>
<p align="center">
   <img src="./.github/assets/screenshots/catppuccin/1.png" style="margin-bottom: 10px;" /> <br>
   <img src="./.github/assets/screenshots/catppuccin/2.png" style="margin-bottom: 10px;" /> <br>
   <img src="./.github/assets/screenshots/catppuccin/3.png" style="margin-bottom: 10px;" /> <br>
</p>  
   <details>
   <summary>
   Old Catppuccin (EXPAND)
   </summary>
   <p align="center">
      <img src="./.github/assets/screenshots/catppuccin/old/1.old.png" style="margin-bottom: 10px;" /> <br>
      <img src="./.github/assets/screenshots/catppuccin/old/2.old.png" style="margin-bottom: 10px;" /> <br>
      <img src="./.github/assets/screenshots/catppuccin/old/3.old.png" style="margin-bottom: 10px;" /> <br>
   </p>
   </details>
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
-   [pkgs](pkgs) 📦 Packages built from source
-   [wallpapers](wallpapers/) 🌄 wallpapers collection

## 📓 Components
|                             | NixOS + Hyprland                                                                              |
| --------------------------- | :---------------------------------------------------------------------------------------------:
| **Window Manager**          | [Hyprland][Hyprland] |
| **Bar**                     | [Waybar][Waybar] |
| **Application Launcher**    | [rofi][rofi] |
| **Notification Daemon**     | [swaync][swaync] |
| **Terminal Emulator**       | [Ghostty][Ghostty] |
| **Shell**                   | [zsh][zsh] + [powerlevel10k][powerlevel10k] |
| **Text Editor**             | [VSCodium][VSCodium] + [Neovim][Neovim] |
| **network management tool** | [NetworkManager][NetworkManager] + [network-manager-applet][network-manager-applet] |
| **System resource monitor** | [Btop][Btop] |
| **File Manager**            | [nemo][nemo] + [yazi][yazi] |
| **Fonts**                   | [Maple Mono][Maple Mono] |
| **Color Scheme**            | [Gruvbox Dark Hard][Gruvbox] |
| **GTK theme**               | [Colloid gtk theme][Colloid gtk theme] |
| **Cursor**                  | [Bibata-Modern-Ice][Bibata-Modern-Ice] |
| **Icons**                   | [Papirus-Dark][Papirus-Dark] |
| **Lockscreen**              | [Hyprlock][Hyprlock] |
| **Image Viewer**            | [imv][imv] |
| **Media Player**            | [mpv][mpv] |
| **Music Player**            | [audacious][audacious] |
| **Screenshot Software**     | [grimblast][grimblast] |
| **Screen Recording**        | [wf-recorder][wf-recorder] |
| **Clipboard**               | [wl-clip-persist][wl-clip-persist] |
| **Color Picker**            | [hyprpicker][hyprpicker] |


## 📝 Shell aliases

<details>
<summary>
Utils (EXPAND)
</summary>

- ```c```     $\rightarrow$ ```clear```
- ```cd```    $\rightarrow$ ```z```
- ```tt```    $\rightarrow$ ```gtrash put```
- ```vim```   $\rightarrow$ ```nvim```
- ```cat```   $\rightarrow$ ```bat```
- ```nano```  $\rightarrow$ ```micro```
- ```code```  $\rightarrow$ ```codium```
- ```diff```  $\rightarrow$ ```delta --diff-so-fancy --side-by-side```
- ```less```  $\rightarrow$ ```bat```
- ```y```     $\rightarrow$ ```yazi```
- ```py```    $\rightarrow$ ```python```
- ```ipy```   $\rightarrow$ ```ipython```
- ```icat```  $\rightarrow$ ```kitten icat```
- ```dsize``` $\rightarrow$ ```du -hs```
- ```pdf```   $\rightarrow$ ```tdf```
- ```open```  $\rightarrow$ ```xdg-open```
- ```space``` $\rightarrow$ ```ncdu```
- ```man```   $\rightarrow$ ```BAT_THEME='default' batman```
- ```l```     $\rightarrow$ ```eza --icons  -a --group-directories-first -1```
- ```ll```    $\rightarrow$ ```eza --icons  -a --group-directories-first -1 --no-user --long```
- ```tree```  $\rightarrow$ ```eza --icons --tree --group-directories-first```
</details>

<details>
<summary>
Nixos (EXPAND)
</summary>

- ```cdnix```      $\rightarrow$ ```cd ~/nixos-config && codium ~/nixos-config```
- ```ns```         $\rightarrow$ ```nom-shell --run zsh```
- ```nix-test```   $\rightarrow$ ```nh os test```
- ```nix-switch``` $\rightarrow$ ```nh os switch```
- ```nix-update``` $\rightarrow$ ```nh os switch --update```
- ```nix-clean```  $\rightarrow$ ```nh clean all --keep 5```
- ```nix-search``` $\rightarrow$ ```nh search```
</details>

<details>
<summary>
Git (EXPAND)
</summary>

- ```g```     $\rightarrow$ ```lazygit```
- ```gf```    $\rightarrow$ ```onefetch --number-of-file-churns 0 --no-color-palette```
- ```ga```    $\rightarrow$ ```git add```
- ```gaa```   $\rightarrow$ ```git add --all```
- ```gs```    $\rightarrow$ ```git status```
- ```gb```    $\rightarrow$ ```git branch```
- ```gm```    $\rightarrow$ ```git merge```
- ```gd```    $\rightarrow$ ```git diff```
- ```gpl```   $\rightarrow$ ```git pull```
- ```gplo```  $\rightarrow$ ```git pull origin```
- ```gps```   $\rightarrow$ ```git push```
- ```gpso```  $\rightarrow$ ```git push origin```
- ```gpst```  $\rightarrow$ ```git push --follow-tags```
- ```gcl```   $\rightarrow$ ```git clone```
- ```gc```    $\rightarrow$ ```git commit```
- ```gcm```   $\rightarrow$ ```git commit -m```
- ```gcma```  $\rightarrow$ ```git add --all && git commit -m```
- ```gtag```  $\rightarrow$ ```git tag -ma```
- ```gch```   $\rightarrow$ ```git checkout```
- ```gchb```  $\rightarrow$ ```git checkout -b```
- ```glog```  $\rightarrow$ ```git log --oneline --decorate --graph```
- ```glol```  $\rightarrow$ ```git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'```
- ```glola``` $\rightarrow$ ```git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all```
- ```glols``` $\rightarrow$ ```git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat```
  
</details>

## 🛠️ Scripts

All the scripts are in ```modules/home/scripts/scripts/``` and are exported as packages in ```modules/home/scripts/default.nix```

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
toggle_blur.sh 
</summary>

**Description:** This script toggles the Hyprland blur effect. If the blur is currently enabled, it will be disabled, and if it's disabled, it will be turned on. 

**Usage:** ```toggle_blur```
</details>

<details>
<summary>
toggle_opacity.sh 
</summary>

**Description:** This script toggles the Hyprland opacity effect. If the opacity is currently set to 0.90, it will be set to 1, and if it's set to 1, it will be set to 0.90. 

**Usage:** ```toggle_opacity```
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

**Description:** This script is for managing Audacious (music player). If Audacious is currently running, it will be killed (stopping the music); otherwise, it will start Audacious in the 8th workspace and resume the music. 

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

View all keybinds by pressing ```$mainMod F1``` and wallpaper picker by pressing ```$mainMod w```. By default ```$mainMod``` is the ```SUPER``` key. 

<details>
<summary>
Keybindings 
</summary>

##### show keybinds list
- ```$mainMod, F1, exec, show-keybinds```

##### keybindings
- ```$mainMod, Return, exec, ghostty```
- ```ALT, Return, exec, [float; center] ghostty```
- ```$mainMod SHIFT, Return, exec, [fullscreen] ghostty```
- ```$mainMod, B, exec, hyprctl dispatch exec '[workspace 1 silent] floorp'```
- ```$mainMod, Q, killactive```
- ```$mainMod, F, fullscreen, 0```
- ```$mainMod SHIFT, F, fullscreen, 1```
- ```$mainMod, Space, togglefloating```
- ```$mainMod, D, exec, rofi -show drun```
- ```$mainMod SHIFT, D, exec, hyprctl dispatch exec '[workspace 4 silent] discord --enable-features=UseOzonePlatform --ozone-platform=wayland'```
- ```$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'```
- ```$mainMod, Escape, exec, hyprlock```
- ```$mainMod SHIFT, Escape, exec, power-menu```
- ```$mainMod, P, pseudo```
- ```$mainMod, J, togglesplit```
- ```$mainMod, T, exec, toggle_opacity```
- ```$mainMod, E, exec, nemo```
- ```$mainMod SHIFT, B, exec, toggle_waybar```
- ```$mainMod, C, exec, hyprpicker -a```
- ```$mainMod, W, exec, wallpaper-picker```
- ```$mainMod, N, exec, swaync-client -t -sw```
- ```$mainMod SHIFT, W, exec, vm-start```

##### screenshot
- ```$mainMod, Print, exec, grimblast --notify --cursor --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png```
- ```,Print, exec, grimblast --notify --cursor --freeze copy area```

##### switch focus
- ```$mainMod, left, movefocus, l```
- ```$mainMod, right, movefocus, r```
- ```$mainMod, up, movefocus, u```
- ```$mainMod, down, movefocus, d```

##### switch workspace
- ```$mainMod, 1, workspace, 1```
- ```$mainMod, 2, workspace, 2```
- ```$mainMod, 3, workspace, 3```
- ```$mainMod, 4, workspace, 4```
- ```$mainMod, 5, workspace, 5```
- ```$mainMod, 6, workspace, 6```
- ```$mainMod, 7, workspace, 7```
- ```$mainMod, 8, workspace, 8```
- ```$mainMod, 9, workspace, 9```
- ```$mainMod, 0, workspace, 10```

##### same as above, but switch to the workspace
- ```$mainMod SHIFT, 1, movetoworkspacesilent, 1```
- ```$mainMod SHIFT, 2, movetoworkspacesilent, 2```
- ```$mainMod SHIFT, 3, movetoworkspacesilent, 3```
- ```$mainMod SHIFT, 4, movetoworkspacesilent, 4```
- ```$mainMod SHIFT, 5, movetoworkspacesilent, 5```
- ```$mainMod SHIFT, 6, movetoworkspacesilent, 6```
- ```$mainMod SHIFT, 7, movetoworkspacesilent, 7```
- ```$mainMod SHIFT, 8, movetoworkspacesilent, 8```
- ```$mainMod SHIFT, 9, movetoworkspacesilent, 9```
- ```$mainMod SHIFT, 0, movetoworkspacesilent, 10```
- ```$mainMod CTRL, c, movetoworkspace, empty```

##### window control
- ```$mainMod SHIFT, left, movewindow, l```
- ```$mainMod SHIFT, right, movewindow, r```
- ```$mainMod SHIFT, up, movewindow, u```
- ```$mainMod SHIFT, down, movewindow, d```
- ```$mainMod CTRL, left, resizeactive, -80 0```
- ```$mainMod CTRL, right, resizeactive, 80 0```
- ```$mainMod CTRL, up, resizeactive, 0 -80```
- ```$mainMod CTRL, down, resizeactive, 0 80```
- ```$mainMod ALT, left, moveactive, -80 0```
- ```$mainMod ALT, right, moveactive, 80 0```
- ```$mainMod ALT, up, moveactive, 0 -80```
- ```$mainMod ALT, down, moveactive, 0 80```

##### media and volume controls
- ```,XF86AudioRaiseVolume, exec, pamixer -i 2```
- ```,XF86AudioLowerVolume, exec, pamixer -d 2```
- ```,XF86AudioMute, exec, pamixer -t```
- ```,XF86AudioPlay, exec, playerctl play-pause```
- ```,XF86AudioNext, exec, playerctl next```
- ```,XF86AudioPrev, exec, playerctl previous```
- ```,XF86AudioStop, exec, playerctl stop```
- ```$mainMod, mouse_down, workspace, e-1```
- ```$mainMod, mouse_up, workspace, e+1```

##### laptop brightness
- ```,XF86MonBrightnessUp, exec, brightnessctl set 5%+```
- ```,XF86MonBrightnessDown, exec, brightnessctl set 5%-```
- ```$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+```
- ```$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-```

##### clipboard manager
- ```$mainMod, V, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;}' | cliphist decode | wl-copy```
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
