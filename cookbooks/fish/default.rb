fisher_path = '~/.config/fish/functions/fisher.fish'
execute 'Install fisherman' do
  command "curl -Lo #{fisher_path} --create-dirs git.io/fisherman"
  not_if "test -e #{fisher_path}"
end
