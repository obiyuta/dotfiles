user_dir = File.join(ENV['HOME'], 'Library/Application Support/Code/User')
config_dir = File.expand_path('../../../config/vscode', __FILE__)

link 'locale.json' do
  link File.join(user_dir, 'locale.json')
  to File.join(config_dir, 'locale.json')
end

link 'settings.json' do
  link File.join(user_dir, 'settings.json')
  to File.join(config_dir, 'settings.json')
end

execute 'Install VSCode extensions' do
  command File.join(config_dir, 'bin', 'setup')
  only_if "test -e #{File.join(config_dir, 'extensions')}"
end
