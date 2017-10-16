source $HOME/.bash_profile
# source $HOME/.web_utils.sh
source $HOME/.env

autoload -U promptinit; promptinit
prompt pure

export PATH="$HOME/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export GOPATH="$HOME/dev/go-code"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.scalaenv/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="/Library/Frameworks/R.framework/Versions/3.3/Resources/library/Rserve/libs:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="$HOME/Packages:$PATH"

export EDITOR=/usr/local/bin/nvim
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_DEFAULT_OPTS='
	--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
	--color info:183,prompt:110,spinner:107,pointer:167,marker:215
'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

eval "$(rbenv init -)"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
eval "$(nodenv init -)"
eval "$(goenv init -)"
eval "$(scalaenv init -)"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh


ZSH_THEME="refined"

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
plugins=(git zsh-syntax-highlighting brew repo bundler docker gem git-flow-avh heroku postgres rake redis-cli rsync tmux)
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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
