ln '.gemrc'
ln '.ruby-version'

version = File.read(File.expand_path('../../../config/.ruby-version', __FILE__))

execute 'Install ruby' do
  command "rbenv install #{version}"
  not_if "test -d ~/.rbenv/versions/#{version}"
end

execute 'Set ruby version' do
  command "rbenv global #{version}"
end

execute 'Install bundler' do
  command 'rbenv exec gem install bundler'
  not_if 'rbenv exec gem list --local | grep bundler'
end
