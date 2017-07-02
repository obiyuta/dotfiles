execute 'Install docker-sync' do
  command 'gem install docker-sync'
  not_if 'which docker-sync'
end
