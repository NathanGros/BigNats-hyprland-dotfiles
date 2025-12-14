# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
unsetopt autocd
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit
# End of lines added by compinstall

# search history matching beginning of line
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end


initialization="clear; fastfetch --config ~/.config/fastfetch/myconfig.jsonc"

# utility
alias c=$initialization
alias l='eza --color=always --long --git --icons=always --group-directories-first'
alias la='eza --color=always --long --git --icons=always --group-directories-first --all'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias shutdown='shutdown now'
alias i='sudo pacman -S'
alias screen='grim -g "$(slurp  -w 0 -b 00000066)" - | wl-copy'
alias fullscreen='grim - | wl-copy'
alias ff='fastfetch'
alias locate='locate -i'
alias bulkrename='cp ~/.config/hypr/scripts/bulk_rename.sh .; ./bulk_rename.sh; rm bulk_rename.sh'
function o() {zathura "$@" & disown}
function cddir() {
    local dir
    dir=$(locate "$@" | fzf) || return
    cd "$dir"
}
function compress() {ffmpeg -i "$@" -fs 8MB -c:v libx264 -preset fast -crf 28 -c:a aac -b:a 96k "~/Videos/compressed_video.mp4"}

# fun packages
alias pipes='pipes.sh -p 6 -RCKr 3000'
alias tty-pipes='pipes.sh -Rp 6 -t 3'
alias clock='tty-clock -cC 0'
alias rain='terminal-rain'
alias matrix='unimatrix -afs 97'

# git
alias gl='git log --all --decorate --oneline --graph'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git pull'

# other
alias cdcours='cd ~/Documents/scolaire/2025-2026_si3/s5'


bindkey -e


eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/mytheme.json)"
eval "$(zoxide init --cmd cd zsh)"
# eval "$(thefuck --alias)"

## Python environment stuff ? idk
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

## Load Angular CLI autocompletion
# source <(ng completion script)

## OCaml
# eval $(opam env)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999999'

eval $initialization
