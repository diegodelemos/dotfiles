# Path to your oh-my-zsh installation.
export ZSH=/Users/rodrigdi/.oh-my-zsh

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

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

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
# Git alias
alias g="git"
# Use IPython inside virtualenv
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
# Read only view files
ev() {
  emacs -nw "$1" --eval '(setq buffer-read-only t)'
}
# yamltojson
yamltojson() {
  python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < $1
}
# Clean docker images ...
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

# Create Dockerfile.debug
WDB='RUN apt-get update && \
    apt-get install -y vim emacs-nox && \
    pip install wdb
ENV WDB_SOCKET_SERVER=wdb
ENV WDB_NO_BROWSER_AUTO_OPEN=True
ENV TERM=xterm
ENV FLASK_DEBUG=1'
devDockerfile() {
    file=${1:-Dockerfile}
    var="$WDB" perl -0pe 's/.*\nFROM python:3.5/$&\n$ENV{"var"}/s' $file > $file.debug
}

# Console two columns color diff
alias ccdiff="git difftool -y -x 'colordiff -y -W $COLUMNS' | less -R"

# avoid closing tmux session when exiting by accident, detach.
exit() {
    if [[ -z $TMUX ]]; then
        builtin exit
    else
        tmux detach
    fi
}

# kubectl autocompletion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
