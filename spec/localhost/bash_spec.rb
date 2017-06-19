require 'spec_helper'

describe package('bash') do
  it { should be_installed }
end

describe file("#{ENV['HOME']}/.bash_profile") do
  bash_profile = File.join(property[:conf_dir].to_s, '.bash_profile')
  content = File.read(bash_profile)

  it { should exist }
  its(:content) { should match content }
end

describe file("#{ENV['HOME']}/.bashrc") do
  bashrc = File.join(property[:conf_dir].to_s, '.bashrc')
  content = File.read(bashrc)

  it { should exist }
  its(:content) { should match content }
end
