ln '.vim'
ln '.vimrc'

bundle_dir = File.join(ENV['HOME'], '.vim/bundle')

directory bundle_dir do
  action :create
end

git 'Pull latest neobundle' do
  destination bundle_dir
  repository 'git@github.com:Shougo/neobundle.vim.git'
  only_if "test -e #{bundle_dir}"
end

install_sh = File.join(bundle_dir, 'bin/install.sh')
execute 'Install NeoBundle' do
  command install_sh  
end
