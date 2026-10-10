
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;2C' forward-word
bindkey '^[[1;2D' backward-word

HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space

setopt autocd
setopt interactivecomments
setopt nomatch

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors 'di=01;37:ln=01;36:ex=01;32:fi=00;37:mi=05;37:or=05;37:so=01;35:do=01;35:bd=01;33:cd=01;33:ma=07;30;47'
zstyle ':completion:*' menu select

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias cls="clear"
alias zshconfig="nano ~/.zshrc"
alias reload="source ~/.zshrc"

alias ls='eza --icons=always --color=always --group-directories-first'
alias ll='eza -l --icons=always --color=always --group-directories-first --git'
alias la='eza -la --icons=always --color=always'
alias lt='eza --tree --icons=always --level=2'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246,bold'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='fg=252'
ZSH_HIGHLIGHT_STYLES[command]='fg=255,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=255,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=255,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=255,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=196,underline'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=248'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=248'
ZSH_HIGHLIGHT_STYLES[path]='fg=250,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=212'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=212'
ZSH_HIGHLIGHT_STYLES[comment]='fg=242,italic'

PROMPT='%F{248}┌──(%F{255}%B%n%b%F{248}@%F{255}%B%m%b%F{248})-[%F{255}%B%~%b%F{248}]%f
%F{248}└─%F{255}%B$%b%f '