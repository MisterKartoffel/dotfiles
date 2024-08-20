# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/felipe/.zshrc'

export EDITOR=nvim
export VISUAL=nvim

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f➤  '

bindkey "^[[3~" delete-char
bindkey "^[[3;5~" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[5~" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[6~" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

alias vim="nvim"
alias fetch="fastfetch --gpu-hide-type integrated"
alias config="/usr/bin/git --git-dir=$HOME/Dotfiles/ --work-tree=$HOME"

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"
alias cd="z"
