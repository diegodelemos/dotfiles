echo "Best Spanish Tortilla recipe ever."
echo ""
echo "Ingredients:"
echo "    - 1 kilogram (about 2 pounds) of potatoes"
echo "    - Salt to taste"
echo "    - 8 large eggs (free range if possible)"
echo "    - 1 yellow onion (very important)"
echo "    - Extra Virgin Olive Oil"
echo ""
echo "Directions:"
echo "    - Heat a 2cm of high quality extra virgin olive oil in a large frying pan at medium low heat."
echo "    - Peel the potatoes and rinse them under cold water."
echo "    - Slice the potatoes and the onions into thin slices."
echo "    - When the oil is hot, add the potatoes and onions, and add more oil if necessary until all are covered."
echo "    - Cook the potatoes and the onions for 20 minutes at a low heat (they may break apart, that is okay)."
echo "    - Once the potatoes are soft and start to become golden, remove them with a slotted spoon into a strainer and allow to cool off while any excess oil drips away"
echo "    - After a few minutes, add the potatoes and onions to the beaten eggs and stir well."
echo "    - In the same pan where you fried the potatoes, remove all the oil (you can reuse it!) and over a medium high heat add the egg mixture."
echo "    - When you are sure that the bottom is cooked and you want to flip the tortilla, take a large plate and put it over the pan and flip quickly!"
echo "    - Finally, slide out of the pan onto a serving plate and let cool a little before diving in."


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
plugins=(
  git
  kubectl
  kube-ps1
  zsh-autosuggestions
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=6

source $ZSH/oh-my-zsh.sh
PROMPT=$PROMPT'$(kube_ps1) '
RPROMPT="[%D{%L:%M:%S}]"

# User configuration

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export REANA_SRCDIR=/Users/rodrigdi/code/reanahub/
export REANA_GITHUB_USER=diegodelemos
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python@3.8/bin/python3.8
source /usr/local/bin/virtualenvwrapper.sh
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${KREW_ROOT:-$HOME/.krew}/bin"

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
  python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' <$1
}

# avoid closing tmux session when exiting by accident, detach.
exit() {
  if [[ -z $TMUX ]]; then
    builtin exit
  else
    tmux detach
  fi
}

# Configuration for kube-ps1
KUBE_PS1_SYMBOL_ENABLE=false
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
