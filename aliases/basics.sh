export EDIROR='nvim'
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

alias dotfiles='nvim ~/.dotfiles/'
alias bashrc='nvim ~/.dotfiles/shell/.bashrc'
alias zshrc='nvim ~/.dotfiles/shell/.zshrc'
alias vv='nvim .'

alias ..='cd ..'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .-='cd -'
alias tmp='cd /tmp'
alias ginr='grep -Inr'
alias agi='ag -i'
alias agw='ag -w'
alias fd='fdfind'

export_from_file() {
  set -o allexport; source "$1"; set +o allexport;
} 
mkcd() {
  mkdir -p "$1" && cd "$1" || exit;
} 
mine() {
  sudo chown -R "$USERNAME" "$1";
}

