#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Disable Ctl-s/Ctl-q (Scroll lock)
stty -ixon

# chruby
# Enable chruby to auto-switch Ruby version
# Also requires a .ruby-version file in each dir
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
# export PATH=/home/sean/.rubies/ruby-2.1.2/bin/ruby:$PATH

# RUBIES=(/home/sean/.rubies/*)

# To use RubyGems
PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"

# Arcanist
export PATH=/home/sean/.builds/arcanist/bin:$PATH

# Install gems locally, override the bundler default
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

# reduce delay between switching modes
export KEYTIMEOUT=1
bindkey -v
zle_default_mode='cmd'

# neovim
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

alias h='heroku'
alias p='padrino'
alias rspecf='be rspec --fail-fast'
alias rc='rubocop'
alias lsa='ls -lsa'
alias be='bundle exec'
# alias vim='nvim'
alias r='ranger'
alias lock='physlock -ds'
# keep the following commands from being saved in .zhistory
setopt HIST_IGNORE_SPACE
alias ls=' ls'
alias lsa=' ls -lsa'
#alias cd=' cd'

# alias tailpg='tail -f -n 0 /opt/local/var/log/postgresql93/postgres.log'

alias gc='gcm'
alias gca='git commit -a'
alias gcar='git commit --amend --reuse-message HEAD'
alias gcarn='git commit --amend --no-verify --reuse-message HEAD'
alias gcam='git commit -a -m'
# --no-verify to override Rubocop.
alias gcn='git commit -nm'
alias gap='git add --patch'
alias gau='git add --update'
alias gs='git status'
alias gsm='git stash -m'
alias gds='git diff --staged'
alias grh='git reset HEAD'
alias gl="log --graph --pretty=format:'%C(red)%h %C(yellow)%aN%Creset%C(cyan)%d%Creset %s %Cgreen(%cr)%Creset %Creset' --all"

# set vi bindings
# alias redis-cli='rlwrap -a -- redis-cli'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
