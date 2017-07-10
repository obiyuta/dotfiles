config_dir = File.expand_path('../../../config', __FILE__)

execute 'Apply macos setting' do
  command './.macos'
  cwd config_dir
end
