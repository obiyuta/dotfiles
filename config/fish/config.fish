#= alias
alias a 'alias'
a ll 'ls -l'
a la 'ls -a'
a lla 'ls -la'
a rm 'rm -i'
a v 'vim'
a vi 'vim'
a vim 'mvim -v'
a be 'bundle exec'

#= homebrew
set -x PATH /usr/local/bin /usr/local/sbin $PATH

#= rbenv
# http://qiita.com/raccy/items/61bd4780b2bd6de49deb
rbenv init - | source

#= nvm
set -gx NVM_DIR (brew --prefix nvm)
set npm_dir {$NVM_PATH}_modules
set -x NODE_PATH $npm_dir

#= imagemagick
set -x PKG_CONFIG_PATH /usr/local/lib/pkgconfig

#= hub
eval (hub alias -s)

#= peco
function fish_user_key_bindings
  bind \cr peco_select_history
end