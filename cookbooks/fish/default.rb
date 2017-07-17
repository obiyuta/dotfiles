execute 'Add fish to shells' do
  command "echo -e \e[31m Add `which fish` to /etc/shells first. \e[m"
  not_if 'cat /etc/shells | grep `which fish`'
end

execute 'Change default shell to fish' do
  command 'chsh -s `which fish`'
  not_if 'test $SHELL = `which fish`'
end

fish_config_path = File.join(ENV['HOME'], '.config', 'fish')

fishfile_path = File.expand_path('../../../config/fish/config.fish', __FILE__)
link 'config.fish' do
  link File.join(fish_config_path, 'config.fish')
  to fishfile_path
end

fisher_install_path = File.join(fish_config_path, '/functions/fisher.fish')
execute 'Install fisherman' do
  command "curl -Lo #{fisher_install_path} --create-dirs git.io/fisherman"
  not_if "test -e #{fisher_install_path}"
end

fishfile_path = File.expand_path('../../../config/fish/fishfile', __FILE__)
fishfile_install_path = File.join(fish_config_path, 'fishfile')
execute 'Rename fishfile if original is exists' do
  rename = File.join(fish_config_path, '_fishfile')
  command "mv #{fishfile_install_path} #{rename}"
  only_if "test -f #{fishfile_install_path} &&
           test ! -L #{fishfile_install_path}"
end

link 'fishfile' do
  link fishfile_install_path
  to fishfile_path
end

# Executing fisherman from ruby
# =========
# $EDITOR ~/.config/fish/fishfile; fisher
# =========
