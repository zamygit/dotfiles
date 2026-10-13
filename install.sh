#!/bin/bash

# Definir colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "-----------------------------------------------"
echo -e "${GREEN}"
cat << 'EOF'
     _         _       __ _ _ 
    | |       | |     / _|(_)| |
  __| |  ___| |_  |_ _  | |   ___  ___
 / _` | / _ \ | __||  _|| || | / _ \/ __|
| (_| || (_) || |_ | |  | || ||  __/\__ \
 \__,_| \___/  \__||_|  |_||_| \___||___/
EOF
echo -e "${NC}                ${YELLOW}by.zamygit${NC}"
echo -e "${NC}                ${YELLOW}i3+polybar+rofi+zsh${NC}"
echo -e "-----------------------------------------------"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo -v
while true; do sudo -v; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -e "${BLUE}[+] Actualizando repositorios e instalando paquetes oficiales...${NC}"
sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm \
    mesa intel-media-driver vulkan-intel lib32-mesa lib32-vulkan-intel libva-utils pulseaudio \
    rofi alacritty picom udiskie feh python-psutil lxappearance lightdm-gtk-greeter-settings \
    breeze base-devel rust unzip nemo firefox git polybar cava pavucontrol \
    mtpfs libmtp gvfs-mtp eza discord code kitty \
    networkmanager network-manager-applet networkmanager-openvpn zsh maim xclip swappy

if ! command -v paru &> /dev/null; then
    echo -e "${BLUE}[+] Instalando Paru desde AUR...${NC}"
    rm -rf /tmp/paru
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru || exit
    # Asegurar que makepkg corra como usuario normal y no como root
    sudo -u "$SUDO_USER" makepkg -si --noconfirm
    cd - || exit
    rm -rf /tmp/paru
fi

echo -e "${BLUE}[+] Instalando paquetes desde AUR...${NC}"
paru -S --noconfirm --needed \
    arc-gtk-theme \
    sublime-text-4 \
    materia-gtk-theme \
    neofetch \
    arandr \
    rar \
    mpc-qt-bin \
    ttf-nerd-fonts-symbols \
    ttf-iosevka-nerd \
    riseup-vpn

echo -e "${BLUE}[+] Copiando configuraciones de 'local/' a sus destinos...${NC}"
mkdir -p ~/.config

if [ -d "$SCRIPT_DIR/local" ]; then
    # Copiar carpetas de configuracion a ~/.config/
    for config_dir in "$SCRIPT_DIR/local"/*/; do
        if [ -d "$config_dir" ]; then
            dir_name=$(basename "$config_dir")
            echo -e "${YELLOW} -> Aplicando config: $dir_name${NC}"
            rm -rf ~/.config/"$dir_name"
            cp -rf "$config_dir" ~/.config/
        fi
    done

    # Copiar el archivo .zshrc o zshrc suelto en local/ hacia el home del usuario
    if [ -f "$SCRIPT_DIR/local/.zshrc" ]; then
        cp -f "$SCRIPT_DIR/local/.zshrc" ~/.zshrc
        echo -e "${YELLOW} -> Aplicando: .zshrc en el directorio home${NC}"
    elif [ -f "$SCRIPT_DIR/local/zshrc" ]; then
        cp -f "$SCRIPT_DIR/local/zshrc" ~/.zshrc
        echo -e "${YELLOW} -> Aplicando: zshrc como ~/.zshrc en el home${NC}"
    fi

    [ -f ~/.config/rofi/launcher.sh ] && chmod +x ~/.config/rofi/launcher.sh
    [ -f ~/.config/rofi/powermenu.sh ] && chmod +x ~/.config/rofi/powermenu.sh
else
    echo -e "${RED}[!] Error: No se encontró la carpeta 'local' al lado de install.sh${NC}"
fi

echo -e "${BLUE}[+] Cambiando la shell por defecto a Zsh...${NC}"
if [ -n "$SUDO_USER" ]; then
    chsh -s "$(which zsh)" "$SUDO_USER"
else
    chsh -s "$(which zsh)"
fi

echo -e "${BLUE}[+] Habilitando NetworkManager y limpiando accesos directos...${NC}"
sudo systemctl enable --now NetworkManager

sudo pacman -Rns --noconfirm xterm 2>/dev/null || true

DESKTOPS_TO_REMOVE=(
    avahi-discover.desktop breezestyleconfig.desktop bssh.desktop bvnc.desktop
    compton.desktop feh.desktop gkbd-keyboard-display.desktop google-maps-geo-handler.desktop
    i3.desktop kcm_breezedecoration.desktop ktelnetservice6.desktop mpc-qt.desktop
    mpv.desktop nemo-autorun-software.desktop nemo-autostart.desktop openstreetmap-geo-handler.desktop
    org.gnupg.pinentry-qt5.desktop org.gnupg.pinentry-qt.desktop org.kde.kiod6.desktop
    org.kde.knewstuff-dialog6.desktop picom.desktop qv4l2.desktop qvidcap.desktop
    rofi.desktop rofi-theme-selector.desktop uxterm.desktop wheelmap-geo-handler.desktop xterm.desktop
)

for file in "${DESKTOPS_TO_REMOVE[@]}"; do
    sudo rm -f "/usr/share/applications/$file"
done

echo -e "\n${YELLOW}-----------------------------------------------${NC}"
read -p "¿Deseas reiniciar el sistema ahora? (s/n): " respuesta

if [[ "$respuesta" =~ ^[Ss]$ ]]; then
    echo -e "${GREEN}[+] Reiniciando el sistema...${NC}"
    sudo reboot
else
    echo -e "${BLUE}[+] Recuerda reiniciar manualmente para aplicar todos los cambios.${NC}"
fi
