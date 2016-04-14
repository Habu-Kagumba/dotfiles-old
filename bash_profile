#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

alias vag='vagrant'
alias vagup='vagrant up'
alias vagdestroy='vagrant destroy'
alias vagssh='vagrant ssh'
alias vaghalt='vagrant halt'

alias htop='sudo htop'

alias chime_off='sudo nvram SystemAudioVolume=%80'
alias chime_on='sudo nvram -d SystemAudioVolume'

alias bundle_stub='bundle install --binstubs .bundle/bin && rbenv rehash'
alias setup='bundle exec rake db:setup'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:migrate RAILS_ENV=production && bundle exec rake db:migrate RAILS_ENV=test '
alias bx='bundle exec'
alias bi='bundle install --path .bundle'
alias rs='bundle exec rails s'
alias rt='bundle exec rake test'

## Add tmux alias here
alias tm='tmux new-session -s "$(basename "$PWD")"'
alias tma='tmux attach-session -t "$(basename "$PWD")"'
alias tmd='tmux detach'
alias tml='tmux ls'
alias tmk='tmux kill-session'
