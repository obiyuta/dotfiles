ln '.gemrc'
ln '.ruby-version'

version = File.read(File.join(ENV['HOME'], '.ruby-version'))

execute 'Install ruby' do
  command "rbenv install #{version}"
  only_if "rbenv versions | grep ${version}"
end

execute 'Set ruby version' do
  command "rbenv global #{version}"
end