# Dotfiles - Arch Linux

Configuración personal basada en el minimalismo, una estética monocromática y un flujo de trabajo optimizado para la eficiencia, el enfoque y la productividad.

## Componentes del Entorno

* **Gestor de Ventanas:** `i3-wm` (Mosaicos optimizados para control por teclado).
* **Barra de Estado:** `Polybar` (Diseño limpio y minimalista).
* **Lanzador y Menús:** `Rofi` (Navegación y control rápido del sistema).
* **Terminal y Shell:** `Alacritty` / `Kitty` con `Zsh`.
* **Tipografía:** `Iosevka Nerd Fonts` y símbolos unificados.

## Estructura del Repositorio

```text
.
├── install.sh
└── local/
    ├── i3/
    ├── polybar/
    ├── rofi/
    ├── alacritty/
    └── .zshrc
```

## Script de Instalación Automatizada (`install.sh`)

El repositorio incluye un script de post-instalación que automatiza completamente el despliegue del entorno:

1. **Actualización y Paquetes Oficiales (`pacman`):** Actualiza el sistema e instala drivers gráficos (Mesa, Vulkan, Intel), entorno gráfico (`i3`, `polybar`, `rofi`, `picom`, `alacritty`), pila de audio (`pulseaudio`, `pavucontrol`, `cava`), herramientas de red (`NetworkManager`) y utilidades esenciales (`git`, `unzip`, `eza`, `zsh`, `code`, `firefox`).
2. **Gestión de AUR (`paru`):** Clona y compila automáticamente `paru` si no está presente, instalando paquetes adicionales como `sublime-text-4`, temas GTK (`arc-gtk-theme`, `materia-gtk-theme`), fuentes y utilidades.
3. **Despliegue de Configuraciones:** Sincroniza los directorios desde `./local/` hacia `~/.config/` y copia el archivo `.zshrc` al directorio home del usuario.
4. **Configuración de Shell y Limpieza:** Establece `Zsh` como la shell predeterminada, habilita los servicios de red necesarios y depura lanzadores `.desktop` redundantes en `/usr/share/applications/` para mantener el menú limpio.

## Guía de Instalación

Ejecuta los siguientes comandos en tu terminal para clonar y desplegar el entorno:

```bash
git clone https://github.com/zamygit/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

Tras finalizar la instalación, reinicia el sistema para aplicar los cambios en la shell y el entorno gráfico.