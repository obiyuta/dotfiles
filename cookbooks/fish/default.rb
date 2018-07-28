execute 'Add fish to shells' do
  command "echo -e \e[31m Add `which fish` to /etc/shells first. \e[m"
  not_if 'cat /etc/shells | grep `which fish`'
end

execute 'Change default shell to fish' do
  command 'chsh -s `which fish`'
  not_if 'test $SHELL = `which fish`'
end

difined_config_dir_path = File.expand_path('../../../config/fish/', __FILE__)

fish_config_path = File.join(ENV['HOME'], '.config', 'fish')
defined_config_path = File.join(difined_config_dir_path, 'config.fish')

execute 'Make fish dir' do
  command "mkdir #{fish_config_path}"
  not_if "test -d #{fish_config_path}"
end

link 'config.fish' do
  link File.join(fish_config_path, 'config.fish')
  to defined_config_path
end

fish_func_path = File.join(fish_config_path, 'functions')
fisher_install_path = File.join(fish_func_path, 'fisher.fish')
execute 'Install fisherman' do
  command "curl -Lo #{fisher_install_path} --create-dirs git.io/fisherman"
  not_if "test -e #{fisher_install_path}"
end

defined_fishfile_path = File.join(difined_config_dir_path, 'fishfile')
fishfile_install_path = File.join(fish_config_path, 'fishfile')
execute 'Rename fishfile if original is exists' do
  rename = File.join(fish_config_path, '_fishfile')
  command "mv #{fishfile_install_path} #{rename}"
  only_if "test -f #{fishfile_install_path} &&
           test ! -L #{fishfile_install_path}"
end

link 'fishfile' do
  link fishfile_install_path
  to defined_fishfile_path
end

# link functions files
defined_func_dir_path = File.join(difined_config_dir_path, 'functions')
Dir.chdir(defined_func_dir_path)
Dir.glob('*.fish') do |file|
  link file do
    link File.join(fish_func_path, file)
    to File.join(defined_func_dir_path, file)
  end
end

# Executing fisherman
# =========
# $EDITOR ~/.config/fish/fishfile; fisher
# =========
