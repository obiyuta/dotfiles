dest_path = File.expand_path('../files/fonts', __FILE__)

git 'Clone fonts' do
  destination dest_path
  repository 'git@github.com:powerline/fonts.git'
  not_if "test -e #{dest_path}"
end

install_sh = File.join(dest_path, 'install.sh')
install_flag = File.join(dest_path, '.installed')

execute 'Install fonts' do
  command './install.sh'
  cwd dest_path
  not_if "test -e #{install_flag}"
end

font_file = '50-enable-terminess-powerline.conf'
font_config = File.join(dest_path, 'fontconfig', font_file)
font_config_dest = File.join(ENV['HOME'], '.config/fontconfig/conf.d')

directory font_config_dest
execute 'Create fontconfig file' do
  command "cp #{font_config} #{font_config_dest}"
  not_if "test -e #{install_flag}"
end

execute 'Re-cache fonts' do
  command 'fc-cache -vf'
  not_if "test -e #{install_flag}"
end

file install_flag do
  action :create
  not_if "test -e #{install_flag}"
end
