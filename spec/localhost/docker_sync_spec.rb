require 'spec_helper'

describe command('command -v "docker-sync"') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match '/.rbenv/' }
end
