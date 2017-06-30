ln '.tmux.conf'

execute 'Reload tmux conf' do
  command "tmux source ~/.tmux.conf"
end
