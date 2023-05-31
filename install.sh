#!/bin/bash

                        ############################################################################################################################
                        #                                                   SCRIPT BY F3L3P1N0                                                     #
                        ############################################################################################################################

# COPIA DE TODOS LOS ARCHIVOS DE CONFIGURACIÓN

function copia() {
    # Alacritty
    mkdir "$HOME/.config/alacritty"
    cp -rv "$1/dotfiles/alacritty/alacritty.yml" "$HOME/.config/alacritty/"

    # bspwm & sxhkd
    mkdir "$HOME/.config/bspwm"
    mkdir "$HOME/.config/sxhkd"
    cp -rv $1/dotfiles/bspwm/* "$HOME/.config/bspwm/"
    cp -rv $1/dotfiles/sxhkd/* "$HOME/.config/sxhkd/"
    chmod +x "$HOME/.config/bspwm/scripts/bspwm_resize"
    chmod +x "$HOME/.config/bspwm/bspwmrc"

    # wallpaper
    mkdir "$HOME/.config/wallpapers"
    cp -rv $1/dotfiles/wallpaper/* "$HOME/.config/wallpapers/"

    # polybar
    mkdir "$HOME/.config/polybar"
    cp -rv $1/dotfiles/polybar/* "$HOME/.config/polybar/"
    chmod +x "$HOME/.config/polybar/killbar.sh" "$HOME/.config/polybar/launch.sh" "$HOME/.config/polybar/tinybar.sh"
    chmod +x "$HOME/.config/polybar/bin/ethernet_status.sh"

    # picom
    mkdir "$HOME/.config/picom"
    cp -rv $1/dotfiles/picom/* "$HOME/.config/picom/"

    # rofi
    mkdir "$HOME/.config/rofi"
    cp -rv $1/dotfiles/rofi/* "$HOME/.config/rofi/"
    chmod +x "$HOME/.config/rofi/powermenu/powermenu"
    rofi-theme-selector

    # zsh
    sudo usermod --shell /usr/bin/zsh $USER
    sudo usermod --shell /usr/bin/zsh root
    cp -rv "$1/dotfiles/.zshrc" "$HOME/"
    sudo ln -s -f "$HOME/.zshrc" "/root/.zshrc"

    # powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k
    cp -rv $1/dotfiles/powerlevel10k/user/.p10k.zsh "$HOME/"
    sudo cp -rv $1/dotfiles/powerlevel10k/root/.p10k.zsh "/root/"

    # plugin sudo
    cd /usr/share
    sudo mkdir zsh-sudo
    sudo chown $USER:$USER zsh-sudo/
    cd zsh-sudo
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

    # descarga de fuentes
    mkdir -v "$1/dotfiles/fonts"
    cd $1/dotfiles/fonts
    megadl --print-names https://mega.nz/file/GxFVSLLY#etuNc6QRrEl6wgl_ZatvomojDhkBTFPqlKS7ELk7KAM

    # fonts
    sudo cp -rv $1/dotfiles/fonts/* "/usr/share/fonts/"
    cd /usr/share/fonts/
    sudo unzip fonts.zip
    sudo rm -rf fonts.zip

    # sddm (Aviso! En este caso se deshabilita lightdm ya que xfce4 utiliza este session manager. En caso de que tu sistema utilice uno distinto, deberás hallarlo y desactivarlo.)
    # Puedes encontrarlo empleando la siguiente comanda: sudo loginctl show-session $XDG_SESSION_ID
    service=$(sudo loginctl show-session $XDG_SESSION_ID | awk -F= '/Service/ {print $2}')
    sudo systemctl disable $service
    sudo systemctl enable sddm
    sudo cp -rv "$1/dotfiles/sddm/wallpaper.jpg" "/usr/share/sddm/themes/Sugar-Candy/Backgrounds/"
    sudo cp -rv "$1/dotfiles/sddm/theme.conf" "/usr/share/sddm/themes/Sugar-Candy/"
    sudo cp -rv "$1/dotfiles/sddm/sddm.conf" "/etc/"
}

# INSTALACION DE REQUERIMIENTOS

function requerimientos() {
    # Update
    sudo pacman -Syu --noconfirm

    # yay
    git clone https://aur.archlinux.org/yay-git.git
    cd yay-git
    makepkg --noconfirm -si

    # git dash xsetroot xrandr xdpyinfo xrdb xset imagemagick megatools bc unzip
    sudo pacman -S --noconfirm git dash xorg-xsetroot xorg-xrandr xorg-xdpyinfo xorg-xrdb xorg-xset imagemagick megatools bc unzip

    # paru
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg --noconfirm -si

    # i3lock-color
    git clone https://aur.archlinux.org/i3lock-color.git
    cd i3lock-color
    makepkg --noconfirm -si
}

# INSTALACION DE TODOS LOS PAQUETES

function paquetes() {
    # Alacritty bspwm sxhkd feh polybar picom flameshot rofi sddm zsh lsd bat zsh-syntax-highlighting zsh-autosuggestions
    sudo pacman -S --noconfirm alacritty bspwm sxhkd feh polybar picom flameshot rofi sddm zsh lsd bat zsh-syntax-highlighting zsh-autosuggestions

    # tema para sddm
    paru -S --noconfirm sddm-theme-sugar-candy-git
}

# INSTALACION DE BETTERLOCKSCREEN

function betterlockscreen() {
    cd "$1/dotfiles/betterlockscreen"
    sudo wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip
    sudo unzip main.zip

    cd betterlockscreen-main/
    chmod u+x betterlockscreen
    sudo cp -rv betterlockscreen /usr/local/bin/

    sudo cp -rv system/betterlockscreen@.service /usr/lib/systemd/system/
    sudo systemctl enable betterlockscreen@$USER
}

# MENSAJES PARA FINALIZAR INSTALACIÓN

function finalizacion() {
    echo "INSTALACIÓN FINALIZADA"
    notify-send "INSTALACIÓN FINALIZADA"
    sleep 1
    notify-send "3"
    sleep 1
    notify-send "2"
    sleep 1
    notify-send "1"
    sleep 1
    notify-send "REINICIANDO..."
    sleep 1
    reboot
}

# SE COMPRUEBA SI EL INSTALADOR SE EJECUTA COMO ROOT

if [ $(whoami) != 'root' ]; then
    ruta=$(pwd)
    requerimientos
    paquetes
    copia "$ruta"
    betterlockscreen "$ruta"
    finalizacion
else
    echo 'Error, el script no debe ser ejecutado como root.'
    exit 0
fi



