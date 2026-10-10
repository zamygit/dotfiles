
# Dotfiles Installer - i3wm + Polybar + Rofi

Script de automatización en Bash para post-instalación y despliegue de entorno de escritorio en Arch Linux.

## Funcionalidades del Script (`install.sh`)

- **Gestión de Paquetes Base (`pacman`):**
  - Actualización general de la base de datos y repositorios del sistema.
  - Instalación de drivers de video e interfaz gráfica (Mesa, Intel Media Driver, Vulkan).
  - Instalación de componentes del entorno gráfico: `i3`, `polybar`, `rofi`, `picom`, `alacritty`, `kitty`, `lxappearance`, `feh`.
  - Instalación de pila de audio (`pulseaudio`, `pavucontrol`, `cava`) y soporte de almacenamiento MTP/GVFS.
  - Instalación de herramientas de red y gestión de conexiones (`NetworkManager`, `network-manager-applet`, `networkmanager-openvpn`).
  - Instalación de aplicaciones adicionales: Firefox, Discord, VS Code, Nemo, eza, Zsh, Rust, Base-devel.

- **Gestión de Paquetes AUR (`paru`):**
  - Verificación y compilación automática de `paru` desde el repositorio de AUR si no está presente en el sistema.
  - Instalación de paquetes AUR: `sublime-text-4`, `arc-gtk-theme`, `materia-gtk-theme`, `neofetch`, `arandr`, `riseup-vpn`, `mpc-qt-bin`, `ttf-nerd-fonts-symbols`, `ttf-iosevka-nerd`.

- **Despliegue de Configuraciones (`dotfiles`):**
  - Sincronización e instalación de directorios de configuración desde `./local/` hacia `~/.config/`.
  - Asignación de permisos de ejecución para scripts de Rofi (`launcher.sh` y `powermenu.sh`).

- **Configuración de Servicios y Limpieza:**
  - Habilitación e inicio inmediato del servicio `NetworkManager.service`.
  - Desinstalación de paquetes innecesarios (`xterm`).
  - Depuración de lanzadores `.desktop` redundantes en `/usr/share/applications/` para optimizar la lista de menú en Rofi.

