# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(/usr/share/.antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
    antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

# Initialize oh-my-posh prompt
eval "$(oh-my-posh init zsh --config $ZDOTDIR/ohmyposh/config.toml)"

# Keybindings
bindkey -v

# History
HISTSIZE=1000
HISTFILE=$ZDOTDIR/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt globdots
setopt correct_all

# Shell integrations
eval "$(fzf --zsh)"

# Completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*:descriptions" format "[%d]"
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"

# Aliases
alias vim="nvim"
alias fetch="fastfetch --gpu-hide-type integrated"
alias config="/usr/bin/git --git-dir=$HOME/Dotfiles/ --work-tree=$HOME"
alias lazyconfig="lazygit --git-dir=$HOME/Dotfiles/ --work-tree=$HOME"
alias ll="eza -1la --color=always --icons=always"
alias trash="gio trash"
alias c="clear"
alias q="exit"

# Helper functions
function nf() { # Neovim Find
    fzf -m --preview='bat --color=always {}' --bind='enter:become($EDITOR {+})'
}

function pqf() { # Pacman Query Find
    pacman -Qq |
    fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(sudo pacman -Rns {})'
}

function psf() { # Pacman Sync Find
    pacman -Slq |
    fzf --preview 'pacman -Si {}' --layout=reverse --bind 'enter:execute(sudo pacman -S {})'
}

function pacman-stray() {
    sudo export LC_ALL=C.UTF-8; comm -13 <(pacman -Qlq | sed 's,/$,,' | sort) <(find /etc /usr /opt -path /usr/lib/modules -prune -o -print | sort)
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
