alias vag='vagrant'
alias vagup='vagrant up'
alias vagdestroy='vagrant destroy'
alias vagssh='vagrant ssh'
alias vaghalt='vagrant halt'

alias git=hub

alias htop='sudo htop'

alias chime_off='sudo nvram SystemAudioVolume=%80'
alias chime_on='sudo nvram -d SystemAudioVolume'

alias bundle_stub='bundle install --binstubs .bundle/bin && rbenv rehash'
alias b='bundle'
alias bx='bundle exec'
alias bi='bundle install --path .bundle'
alias rd='rails s'
alias rt='rake test'
alias rc='rails c'
alias rr='rake routes'
alias rds='rake db:setup'
alias rdm='rake db:migrate'
alias rgc='rails g controller'
alias rga='rails g assets'
alias rgd='rails g decorator'
alias rgg='rails g generator'
alias rgh='rails g helper'
alias rgml='rails g mailer'
alias rgmg='rails g migration'
alias rgmd='rails g model'
alias rgr='rails g resource'
alias rgs='rails g scaffold'
alias rgsc='rails g scaffold_controller'
alias rgsm='rails g session_migration'
alias rgst='rails g stylesheets'
alias rgt='rails g task'

## Add tmux alias here
alias tm='tmux new-session -s "$(basename "$PWD")"'
alias tma='tmux attach-session -t "$(basename "$PWD")"'
alias tmd='tmux detach'
alias tml='tmux ls'
alias tmk='tmux kill-session'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/habu/.sdkman"
[[ -s "/Users/habu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/habu/.sdkman/bin/sdkman-init.sh"
if [ -e /Users/habu/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/habu/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
