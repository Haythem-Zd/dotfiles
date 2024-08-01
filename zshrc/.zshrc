# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

#source $ZSH/oh-my-zsh.sh

#Load Antigen
source ~/antigen.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Variables needed for Feedos developer account configuration

export USER=haythem.zidi                          # user on the LDAP dev (gerrit, jenkins) and redmine and Scale FT
export USERNAME=haythem.zidi@devel.iress.com.au   # user on the linux laptop

export FEEDOS_GIT_SRC_DEFAULT="/home/${USERNAME}/dev/git/dev/${USER}_feedos"
if [ -f  ${FEEDOS_GIT_SRC_DEFAULT}/feedos_package/.qhgit_rc ]; then
    source ${FEEDOS_GIT_SRC_DEFAULT}/feedos_package/.qhgit_rc
else
   echo  "Error: unable to source ${FEEDOS_GIT_SRC_DEFAULT}/feedos_package/.qhgit_rc  please check HOME USER env vars and feedos_package is correcly cloned"
fi
alias src="int_unset_env;cd $FEEDOS_GIT_SRC_DEFAULT"
export FEEDOS_SRC=$FEEDOS_GIT_SRC_DEFAULT

export FEEDOS_CORE_QA_PATH=${FEEDOS_GIT_SRC_DEFAULT}/feedos_core_qa
export RSYNC_CORE_QA_DESTINATION_SERVER=lonld6-lxc-rnd01
export RSYNC_CORE_QA_DESTINATION_PATH=/home/${USER}/git/feedos_core_qa
if [ -f  ${FEEDOS_CORE_QA_PATH}/scripts/bashrc ]; then
  source ${FEEDOS_CORE_QA_PATH}/scripts/bashrc
fi

alias ll='ls -alF'
alias la='ls -A'

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

. ~/.aliases


# Load Antigen configurations
antigen init ~/.antigenrc


###############  Netskope Fixes  ###############
export REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
export SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
export CONAN_CACERT_PATH="/etc/ssl/certs/ca-certificates.crt"
export CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
export NODE_EXTRA_CA_CERTS="/usr/local/share/ca-certificates/netskope-ca-merged.crt"
export GAM_CA_FILE="/etc/ssl/certs/ca-certificates.crt"
export npm_config_cafile="/etc/ssl/certs/ca-certificates.crt"
export CYPRESS_DOWNLOAD_USE_CA=1
################################################
