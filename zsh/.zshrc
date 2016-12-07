source $HOME/.bash_profile
# source $HOME/.web_utils.sh
source $HOME/.env
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export GOPATH=$HOME/Projects/Go-code
export PATH="$HOME/.rbenv/bin:/usr/local/heroku/bin:/usr/local/go/bin:$GOPATH/bin:$HOME/.rbenv/shims:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export EDITOR=/usr/local/bin/vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

eval "$(rbenv init -)"

if [[ $COLORTERM == "gnome-terminal" ]]; then
            export TERM="xterm-256color"
fi
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(virtualenvwrapper git zsh-syntax-highlighting brew repo bundler docker gem git-flow-avh heroku postgres rake redis-cli rsync tmux)
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  # Read Mac .profile, if present.
fi

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

# export WORKON_HOME=~/Env
# source /usr/local/bin/virtualenvwrapper.sh

# added by travis gem
[ -f /home/herbert/.travis/travis.sh ] && source /home/herbert/.travis/travis.sh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="/Users/herbertkagumba/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function git() { hub $@; }

pips() {
    package_name=$1
    requirements_file=$2
    if [[ -z $requirements_file ]]
    then
        requirements_file='./requirements.txt'
    fi
    pip install $package_name && pip freeze | grep -i $package_name >> $requirements_file
}

# added by travis gem
[ -f /Users/herbertkagumba/.travis/travis.sh ] && source /Users/herbertkagumba/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
