ln '.gitconfig'
ln '.gitignore_global'

execute 'Install git lfs' do
  command 'git lfs install'
end
