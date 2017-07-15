dest_path = File.expand_path('../files/fonts', __FILE__)

git 'Clone fonts' do
  destination dest_path
  repository 'git@github.com:powerline/fonts.git'
  not_if "test -e #{dest_path}"
end

install_sh = File.join(dest_path, 'install.sh')

execute 'Install fonts' do
  command './install.sh'
  cwd dest_path
  only_if "test -e #{install_sh}"
end

font_config = File.join(dest_path, 'fontconfig', '50-enable-terminess-powerline.conf')
font_config_dest = File.join(ENV['HOME'], '.config/fontconfig/conf.d')

directory font_config_dest
execute 'Create fontconfig file' do
  command "mv #{font_config} #{font_config_dest}"
  only_if "test -e #{install_sh}"
end

execute 'Re-cache fonts' do
  command 'fc-cache -vf'
  only_if "test -e #{install_sh}"
end

file install_sh do
  action :remove
  only_if "test -e #{install_sh}"
end