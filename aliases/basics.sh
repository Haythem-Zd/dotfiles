alias z='zsh'
alias c='clear'
alias p='pwd'
alias g='git'
alias rp='realpath'

alias cl='colorls'
alias cll='colorls -lah'
alias x='exa -lah'
alias x1='exa -1'
alias l='ls -lah'
alias llh='ll -h'
alias ldr='ls -d */'
alias tl='tree -L'

alias ..='cd ..'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .-='cd -'
mkcd() { mkdir -p "$1" && cd "$1"; } 

alias ginr='grep -Inr'
alias agi='ag -i'
alias agw='ag -w'
alias fd='fdfind'

alias reboot='sudo /sbin/reboot'

alias st='subl'
alias gti='git'
alias gck='git checkout'
alias gtl='git log | bat'
alias gll='git log --oneline'
alias gss='git show --summary'
alias gts='git status'
alias gtb='git branch'
alias grh='git reset --hard'
alias gdf='git diff'
alias gtk='gitk --all'
alias gog="git log  --abbrev-commit --name-status --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gll='git log --oneline'
alias gtc='git checkout'
alias gcb='git checkout -b'
alias glc="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
# rename a local branch to the format prXXXXXX
function gb2pr() {
  git branch -M "pr${1?ERROR: provide a redmine ticket number}"
}

function ghpr() {
  GH_FORCE_TTY=100% gh pr list | fzf --query "$1" --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout  
}


retag(){
    git tag -d "$1";
    git push --delete origin "$1";
    git tag -m "$1" "$1";
    git push origin "$1" 
}
deltag(){
    git tag -d "$1";
    git push --delete origin "$1";
}

find_tag_of_ticket(){
    commit="$(git log --oneline | grep $1 | awk '{print $1}')"
    git name-rev --tags --name-only "$commit"
}

alias cnn='conan'
alias cnnclean='rm -rf conan_imports_manifest.txt package build_subfolder source_subfolder conanbuildinfo.cmake conanbuildinfo.mak conanbuildinfo.txt conaninfo.txt conan.lock graph_info.json conaninfo.txt'

alias v='nvim'

mine() {
  sudo chown -R $USERNAME "$1"
}

# bat related aliases
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDIROR='nvim'

alias f='fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}''

alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
} # to be used like this : $ help git, $ help ls...

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}


printfunc() {
    type -f "$1" | bat --plain --language=bash
}


export_from_file() { set -o allexport; source "$1"; set +o allexport;} 


# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dim='docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"'
alias drm='docker rmi -f'
dx() {
    docker run --rm -it "${1?ERROR: provide a docker image}" bash
}

# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
#f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy; }
#fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

alias rr='ranger'


# IRESS ADTS Aliases

#find a prod server
function prod ()
{
(set -e; cd /tmp && wget -N -q "https://dashboard-qh.mhf.mhc/servers.conf" )
cat /tmp/servers.conf | /bin/grep -i "${1?need server name}"
}

alias gmaj='git fetch --all ; git fetch --force --tags ; git pull'  

alias bastion='ssh lonitx-r1b3-18'
alias off='ssh feedosrepository-officialpackages'
alias libs='ssh feedosrepository-feedoslibs'
alias rnd01='ssh lonld6-lxc-rnd01'

rnd()
{
    ssh lonld6-lxc-rnd"${1?need rnd server name. Examples 01,02...}"
}

dssh()
{
    ssh -t lonitx-r1b3-18 "ssh -i ~/.ssh/id_rsa_feedosdev feedosdev@${1?server name required}"
}

compile_core_on_server()
{
    server_id=${1}
    shift
    ${FEEDOS_SRC}/feedos_package/build/remote_unix_build.sh -use_local_fhlib_core -ccache buildfeedos-${server_id}-lxcdebian8 -C ${PWD#${FEEDOS_SRC}/} -f Makefile.bs COMPILER_VERSION=-4.9 ADMIN=1 QUICKFIX=1 $*
}
ccs()
{
    debian_version=${1}
    shift
    server_id=${1}
    shift    
    compiler_version=${1}
    shift
    ${FEEDOS_SRC}/feedos_package/build/remote_unix_build.sh -use_local_fhlib_core -ccache buildfeedos-${server_id}-lxcdebian${debian_version} -C ${PWD#${FEEDOS_SRC}/} -f Makefile.bs COMPILER_VERSION=-${compiler_version} ADMIN=1 QUICKFIX=1 $*
}
compile_api_on_server()
{
    server_id=${1}
    shift
    ${FEEDOS_SRC}/feedos_package/build/remote_unix_build.sh -ccache buildfeedos-${server_id}-lxcdebian8 -C ${PWD#${FEEDOS_SRC}/} COMPILER_VERSION=-4.9 $*
}

compile_api_on_debian10()
{
    server_id=${1}
    shift
    ${FEEDOS_SRC}/feedos_package/build/remote_unix_build.sh -ccache buildfeedos-${server_id}-lxcdebian10 -C ${PWD#${FEEDOS_SRC}/} COMPILER_VERSION=-8 STATIC=0 $*
}

aaaaaaa()
{
    ${FEEDOS_SRC}/feedos_package/build/remote_unix_build.sh -use_local_fhlib_core -ccache buildfeedos-01-lxcdebian9 -C ${PWD#${FEEDOS_SRC}/} -f Makefile.bs COMPILER_VERSION=-6 STATIC=0 ADMIN=1 QUICKFIX=1 $*
}

compile_core_on_docker()
{
    server_id=dev-core-01
    docker_image=jenkins-gcc4.9-agent
    ${FEEDOS_SRC}/feedos_package/build/remote_unix_build.sh -build_on_docker ${docker_image} ${server_id} -C ${PWD#${FEEDOS_SRC}/} -f Makefile.bs COMPILER_VERSION=-4.9 ADMIN=1 QUICKFIX=1 $*
}

compile_core_on_docker2()
{
    server_id=dev-core-02
    docker_image=jenkins-agent-debian8
    ${FEEDOS_SRC}/feedos_package/build/remote_unix_build.sh -build_on_docker ${docker_image} ${server_id} -C ${PWD#${FEEDOS_SRC}/} -f Makefile.bs COMPILER_VERSION=-4.9 ADMIN=1 QUICKFIX=1 $*
}

compile_fh_on_docker()
{
    server_id=dev-core-02
    docker_image=jenkins-agent-debian8
    ${FEEDOS_SRC}/feedos_package/build/remote_unix_build.sh -build_on_docker ${docker_image} ${server_id} -C ${PWD#${FEEDOS_SRC}/} COMPILER_VERSION=-4.9 $*
}

alias rebase_here='${FEEDOS_SRC}/feedos_fhtools/dev_scripts/rebase_here.sh $*'
alias stfu='sudo systemctl stop stagentd.service ws1-hub.service sentinelone'
alias netskope-off='sudo systemctl stop stagentd.service'
alias netskope-on='sudo systemctl start stagentd.service'

rpsm()
{
    servers=("dev-core-01" "dev-core-02" "lonld6-lxc-rnd01" "lonld6-lxc-rnd02" "lonld6-lxc-rnd03" "lonld6-lxc-rnd04" "lonld6-lxc-rnd05")
    for srv in $servers; do
        echo "~~~$srv~~~";
        ssh $srv 'ps -fu haythem.zidi' | grep -Ev 'sshd|ps -fu|sd-pam|systemd|ssh-agent';
    done
}


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

