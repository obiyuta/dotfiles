#alias
alias a='alias'
a ll='ls -l'
a la='ls -a'
a lla='ls -la'
a rm='rm -i'
a v='vim'
a vi='vim'
a vim='mvim -v'
# Dash shortcut
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

#= Brewfile
export HOMEBREW_BREWFILE=/usr/local/Library/Brewfile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Coloring ls command
export CLICOLOR=1
export LSCOLORS="cxfxcxdxbxegedabagacad"

#brew
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

#hub
eval "$(hub alias -s)"
