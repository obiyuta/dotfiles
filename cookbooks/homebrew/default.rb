
execute 'Install Homebrew' do
  command 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  not_if 'test $(which brew)'
end

brewfile_dir = File.expand_path('../../../Brewfile', __FILE__)
brewfile = File.join(brewfile_dir, 'Brewfile')
brewfile_global = File.join(ENV['HOME'], '.Brewfile')

git 'Clone Brewfile' do
  destination brewfile_dir
  repository 'git@github.com:obiyuta/Brewfile.git'
  not_if "test -e #{brewfile_dir}"
end

execute 'Pull latest Brewfile' do
  command 'git pull origin master'
  cwd brewfile_dir
  only_if "test -e #{brewfile_dir}"
end

link '.Brewfile' do
  link brewfile_global
  to brewfile
end

execute 'Install from Brewfile' do
  command 'brew bundle --global'
  not_if 'brew bundle check --global'
end
