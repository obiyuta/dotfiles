require 'spec_helper'

describe package('git') do
  it { should be_installed }
end

describe file("#{ENV['HOME']}/.gitconfig") do
  gitconfig = File.join(property[:conf_dir].to_s, '.gitconfig')
  content = File.read(gitconfig)

  it { should exist }
  its(:content) { should match content }
end

describe file("#{ENV['HOME']}/.gitignore_global") do
  gitignore_global = File.join(property[:conf_dir].to_s, '.gitignore_global')
  content = File.read(gitignore_global)

  it { should exist }
  its(:content) { should match content }
end
