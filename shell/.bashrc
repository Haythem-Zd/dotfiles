# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH=~/.oh-my-bash
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="ht"
# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true
# To enable/disable display of Python virtualenv and condaenv
OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
DISABLE_UPDATE_PROMPT=true

source "$OSH"/oh-my-bash.sh

source ~/.dotfiles/aliases/basics.sh
source ~/.dotfiles/aliases/extra.sh
[[ -f ~/work-aliases.sh ]] && source ~/work-aliases.sh
