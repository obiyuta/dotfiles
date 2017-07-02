require 'spec_helper'

describe command('which fish') do
  its(:stdout) { should match '/usr/local/bin/fish' }
end

describe file("#{ENV['HOME']}/.config/fish/functions/fisher.fish") do
  it { should exist }
end
