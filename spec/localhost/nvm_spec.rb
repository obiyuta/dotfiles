require 'spec_helper'

describe package('nvm') do
  it { should be_installed }
end

describe file("#{ENV['HOME']}/.nvmrc") do
  nvmrc = File.join(property[:conf_dir].to_s, '.nvmrc')
  content = File.read(nvmrc)

  it { should exist }
  its(:content) { should match content }
end
