require 'spec_helper'

describe package('rbenv') do
  it { should be_installed }
end

version = File.read(File.join(property[:conf_dir].to_s, '.ruby-version'))

describe file("#{ENV['HOME']}/.rbenv/shims/ruby") do
  it { should exist }
end

describe command('which ruby') do
  its(:stdout) { should match /.rbenv/ }
end

describe file("#{ENV['HOME']}/.rbenv/shims/bundler") do
  it { should exist }
end

describe command('which bundler') do
  its(:stdout) { should match /.rbenv/ }
end

describe file("#{ENV['HOME']}/.ruby-version") do
  it { should exist }
  its(:content) { should match version }
end

describe command('rbenv global') do
  its(:stdout) { should match version }
end