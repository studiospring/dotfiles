#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# To use RubyGems
# PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"

# Install gems locally, override the bundler default
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
