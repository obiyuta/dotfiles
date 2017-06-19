require 'spec_helper'

describe command 'test $(which brew)' do
  its(:exit_status) { should eq 0 }
end

describe file("#{ENV['HOME']}/.Brewfile") do
  it { should exist }
end
