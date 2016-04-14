source $HOME/.bash_profile

# RVM
eval "$(rbenv init -)"

export PATH="/usr/local/heroku/bin:$PATH"
export ANDROID_HOME=/Users/habu/Library/Android/sdk
export HOMEBREW_GITHUB_API_TOKEN=1eb889d8ba1eea1e979e25dbdf7d56f63e1bb89d
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
# Gradle
if [[ -d "$HOME/Packages/gradle-2.11" ]]; then
    export GRADLE_HOME="$HOME/Packages/gradle-2.11"
    PATH="$PATH:$GRADLE_HOME/bin"
fi
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
plugins=(git osx zsh-syntax-highlighting brew repo sudo bundler web-search boot2docker django docker gem git-flow-avh heroku node npm postgres rails rake redis-cli rsync ruby ssh-agent tmux thor zeus)

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

# Custom commands

# Git add all, commit and push to master (Initialize repo)

gvc() {
  if [ -d '.git' ]; then
    echo "Automated version control..."
  else
    g init
  fi
  ga $@ && gc && ggp
}

# create new rails app

rails_new() {
  rails new $1 && $1 && gvc . && vim
}

