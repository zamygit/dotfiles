# Dotfiles

Configuración personal de **Arch Linux + i3wm**. Entorno enfocado en minimalismo, estética oscura/monocromática y flujo de trabajo 100% por teclado.

## Componentes

* **WM:** `i3-wm`
* **Barra:** `Polybar`
* **Lanzador:** `Rofi`
* **Terminal:** `Kitty` + `Zsh`
* **Fuentes:** `Iosevka Nerd Font 8`
* **Compositor:** `Picom`
* **Capturas:** `maim` + `swappy` + `xclip`
* **Distribución de Teclado:** `us,es` (cambio con `xkb-switch`)

## Atajos de Teclado (`$mod` = Super / Mod4)

### Aplicaciones y Sistema
* `$mod` + `Enter` — Abrir terminal (`kitty`)
* `$mod` + `q` — Lanzador de aplicaciones (`rofi`)
* `$mod` + `w` — Cerrar ventana enfocada
* `$mod` + `p` — Menú de apagado (`powermenu.sh`)
* `$mod` + `Shift` + `c` — Recargar configuración de i3
* `$mod` + `Shift` + `r` — Reiniciar i3
* `$mod` + `Space` — Cambiar distribución de teclado (`xkb-switch`)

### Capturas de Pantalla
* `$mod` + `Shift` + `s` — Captura rápida (selección directa al portapapeles)
* `$mod` + `Shift` + `x` — Captura con editor interactivo (`swappy`)

### Navegación y Control de Ventanas
* `$mod` + `j` / `k` / `i` / `l` — Mover foco (Izquierda / Abajo / Arriba / Derecha)
* `$mod` + `Shift` + `j` / `k` / `i` / `l` — Mover ventana (Izquierda / Abajo / Arriba / Derecha)
* `$mod` + `f` — Alternar pantalla completa
* `$mod` + `Tab` — Cambiar a modo pestañas (`tabbed`)
* `$mod` + `e` — Alternar división horizontal/vertical (`toggle split`)
* `$mod` + `Shift` + `Space` — Alternar modo flotante
* `$mod` + `a` — Seleccionar contenedor padre
* `$mod` + `r` — Entrar en modo redimensionar (`resize`)

### Espacios de Trabajo
* `$mod` + `1` / `2` / `3` — Cambiar al workspace 1, 2 o 3
* `$mod` + `Shift` + `1` / `2` / `3` — Mover ventana al workspace 1, 2 o 3

### Audio
* `XF86AudioRaiseVolume` — Subir volumen (+10%)
* `XF86AudioLowerVolume` — Bajar volumen (-10%)
* `XF86AudioMute` — Mutear audio
* `XF86AudioMicMute` — Mutear micrófono

## Estructura

```text
.
├── install.sh
└── local/
    ├── i3/
    ├── polybar/
    ├── rofi/
    ├── picom/
    ├── wallpaper/
    └── .zshrc
```

> **Nota:** El repositorio y el script de automatización (`install.sh`) se encuentran actualmente en desarrollo.
