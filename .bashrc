#= alias
alias a='alias'
a ll='ls -l'
a la='ls -a'
a lla='ls -la'
a rm='rm -i'
a v='vim'
a vi='vim'
a vim='mvim -v'
a be='bundle exec'

#= Dash shortcut
# cf: $ dash vim
function dash() {
    open dash://$1
}

#PATH
export PATH=/usr/local/bin:$PATH

#= rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#= imagemagick
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/opt/local/sbin
export PATH=$PATH:~/bin
export PATH=$PATH:$HOME/Library/Haskell/bin

#= mysql
export PATH=/usr/local/mysql/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#= Coloring ls command
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#= brew / brewfile
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi
export HOMEBREW_BREWFILE=~/Brewfile

#= bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#= .inputrc
[ -f ~/.inputrc ] && bind -f ~/.inputrc

#= hub
eval "$(hub alias -s)"

#= nvm
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

#= bash-git-prompt
# see: https://github.com/magicmonty/bash-git-prompt
# if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
# fi
