# apex
# https://github.com/apex/apex
execute 'Install apex' do
  command 'curl https://raw.githubusercontent.com/apex/apex/master/install.sh | sh'
  not_if 'test -e /usr/local/bin/apex'
end
