execute 'Add fish to shells' do
  command "echo -e \e[31m Add `which fish` to /etc/shells first. \e[m"
  not_if 'cat /etc/shells | grep `which fish`'
end

execute 'Change default shell to fish' do
  command 'chsh -s `which fish`'
  not_if 'test $SHELL = `which fish`'
end

fisher_config_path = File.join(ENV['HOME'], '.config', 'fish')
fisher_install_path = File.join(fisher_config_path, '/functions/fisher.fish')

execute 'Install fisherman' do
  command "curl -Lo #{fisher_install_path} --create-dirs git.io/fisherman"
  not_if "test -e #{fisher_install_path}"
end

fishfile_path = File.expand_path('../../../config/fishfile', __FILE__)
fishfile_install_path = File.join(fisher_config_path, 'fishfile')

execute 'Rename fishfile if original is exists' do
  rename = File.join(fisher_config_path, '_fishfile')
  command "mv #{fishfile_install_path} #{rename}"
  only_if "test -f #{fishfile_install_path} &&
           test ! -L #{fishfile_install_path}"
end

link 'fishfile' do
  link fishfile_install_path
  to fishfile_path
end

execute 'Install fish plugins' do
  command '$EDITOR ~/.config/fish/fishfile; fisher'
end
