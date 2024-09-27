# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if not downloaded
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source and load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Initialize oh-my-posh prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Source plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Keybindings
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[5~" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[6~" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# History
HISTSIZE=1000
HISTFILE=$HOME/.zsh_history
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

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
export PATH="$HOME/Scripts:$PATH"
export LS_COLORS="$(vivid generate catppuccin-mocha)"
export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --color=selected-bg:#45475a \
    --multi"

# Environments
export EDITOR=nvim
export VISUAL=nvim

# Completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*:descriptions" format "[%d]"
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color $realpath"

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
nf() {
    fzf -m --preview='bat --color=always {}' --bind='enter:become($EDITOR {+})'
}

cdf() {
    cd $(fd -Ht d . |
        fzf --preview='eza -1la --color=always --icons=always {}' $1)
}

pqf() {
    pacman -Qq |
    fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(sudo pacman -Rns {})'
}

psf() {
    pacman -Slq |
    fzf --preview 'pacman -Si {}' --layout=reverse --bind 'enter:execute(sudo pacman -S {})'
}
