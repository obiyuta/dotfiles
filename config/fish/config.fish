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
a dc 'docker-compose'
a kc 'kubectl'

#= homebrew
set -x PATH /usr/local/bin /usr/local/sbin $PATH

#= direnv
set -x EDITOR vim
eval (direnv hook fish)

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


#= theme (bobthefish)
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
# set -g theme_display_hg yes
# set -g theme_display_virtualenv yes
# set -g theme_display_ruby yes
# set -g theme_display_user no
# set -g theme_display_vi yes
set -g theme_display_date no 
# set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
# set -g theme_title_display_path yes
# set -g theme_title_display_user yes
# set -g theme_title_use_abbreviated_path yes
# set -g theme_date_format "+%a %H:%M"
# set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
# set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes 
# set -g default_user your_normal_user
set -g theme_color_scheme dark
# set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 1
set -g theme_newline_cursor no

# The next line updates PATH for the Google Cloud SDK.
set HOMEBREW_CASK_PATH /usr/local/Caskroom/
if [ -f "$HOMEBREW_CASK_PATH/google-cloud-sdk/path.bash.inc" ]; 
  bass source "$HOMEBREW_CASK_PATH/google-cloud-sdk/path.bash.inc"
end;
if [ -f "$HOMEBREW_CASK_PATH/google-cloud-sdk/completion.bash.inc" ]; 
  bass source "$HOMEBREW_CASK_PATH/google-cloud-sdk/completion.bash.inc"
end;
