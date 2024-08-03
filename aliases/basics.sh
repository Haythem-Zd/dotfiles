alias z='zsh'
alias v='nvim'
alias c='clear'
alias p='pwd'
alias rp='realpath'
alias rr='ranger'

alias l='ls -lah'
alias llh='ll -h'
alias tl='tree -L'
alias ldr='ls -d */'
alias x1='exa -1'
alias x='exa -lah'
alias cl='colorls'
alias cll='colorls -lah'

alias ..='cd ..'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .-='cd -'
mkcd() { mkdir -p "$1" && cd "$1"; } 
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy; }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

alias ginr='grep -Inr'
alias agi='ag -i'
alias agw='ag -w'
alias fd='fdfind'

mine() {
  sudo chown -R $USERNAME "$1"
}
export_from_file() { set -o allexport; source "$1"; set +o allexport;} 
export EDIROR='nvim'

