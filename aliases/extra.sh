############ git stuf #############

alias st='subl'
alias g='git'
alias gti='git'
alias gck='git checkout'
alias gtl='git log | bat'
alias gll='git log --oneline'
alias gss='git show --summary'
alias gts='git status'
alias gtb='git branch'
alias grh='git reset --hard'
alias gdf='git diff'
alias gdff='GIT_EXTERNAL_DIFF=difft git diff'
alias gtk='gitk --all'
alias gog="git log  --abbrev-commit --name-status --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gll='git log --oneline'
alias gtc='git checkout'
alias gcb='git checkout -b'
alias glc="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

# use gh cli and fzf to get a list with preview of PRs in current directory
function ghpr() {
  GH_FORCE_TTY=100% gh pr list | fzf --query "$1" --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout;
}

function retag(){
    git tag -d "$1";
    git push --delete origin "$1";
    git tag -m "$1" "$1";
    git push origin "$1" ;
}
function deltag(){
    git tag -d "$1";
    git push --delete origin "$1";
}

################# tricks with fzf and bat ####################

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# bat related aliases
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias bathelp='bat --plain --language=Manpage'
help() {
    "$@" --help 2>&1 | bathelp;
} # to be used like this : $ help git, $ help ls...


printfunc() {
    type -f "$1" | bat --plain --language=bash;
}

################ Docker stuff ########################
alias dps='docker ps --format "{{.Names}}\t{{.Image}}\t{{.Ports}}"'
alias dim='docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"'
alias drm='docker rmi -f'
dx() {
    docker run --rm -it "${1?ERROR: provide a docker image}" bash
}

#################################################
alias server='python3 -m http.server 1990'
alias ktrc='nvim ~/.config/kitty/kitty.conf'
alias nvrc='nvim ~/.config/nvim'
alias ks='killall ssh'
# cmake CPM
export CPM_SOURCE_CACHE=$HOME/.cache/CPM

# weather forecast service
function weather() {
 local _locations="${1}"
 local _options="${2}"
 curl --silent "wttr.in/${_locations}?${_options}"
}

function meteo() {
  weather "${1}" "lang=fr&${2}"
}

