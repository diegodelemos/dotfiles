# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export REANA_SRCDIR=/Users/rodrigdi/code/reanahub/
export REANA_GITHUB_USER=diegodelemos
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
source /usr/local/bin/virtualenvwrapper.sh
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# fzf fuzzy history search
# brew install fzf
# $(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# Edit config shortcuts
alias tmuxconfig="emacs -nw ~/.tmux.conf"
alias zshconfig="emacs -nw ~/.zshrc"
alias ohmyzsh="emacs -nw ~/.oh-my-zsh"
alias gitconfig="emacs -nw ~/.gitconfig"
alias spacemacsconfig="emacs -nw ~/.spacemacs"
# REANA aliases
alias rc="reana-client"
# Git alias
alias git=hub
alias g=hub
# React Native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
# Use IPython inside virtualenv
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
# Clean docker images ...
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '
# Console two columns color diff
alias ccdiff="git difftool -y -x 'colordiff -y -W $COLUMNS' | less -R"
# Improvements
alias cat='bat'
# man for human beings
alias help='tldr'

# Utilities

# yamltojson
yamltojson() {
  python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < $1
}

# avoid closing tmux session when exiting by accident, detach.
exit() {
    if [[ -z $TMUX ]]; then
        builtin exit
    else
        tmux detach
    fi
}
