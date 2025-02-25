# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bignat/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit
# End of lines added by compinstall

alias c='clear; fastfetch'
alias l='eza --color=always --long --git --icons=always'
alias la='eza --color=always --long --git --icons=always --all'
alias cdcours='cd ~/Documents/scolaire/2024-2025_si3/cours/'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias shutdown='shutdown now'
alias pipes='pipes.sh -p 6 -RCKr 3000'
alias clock='tty-clock -cC 0'
alias f='ranger'
alias i='sudo pacman -S'
alias screen='grim -g "$(slurp  -w 0 -b 00000066)" - | wl-copy'
alias fullscreen='grim - | wl-copy'
# git aliases
alias gl='git log --all --decorate --oneline --graph'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git pull'

bindkey -e

fastfetch

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/mytheme.json)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"

export LD_LIBRARY_PATH=.
