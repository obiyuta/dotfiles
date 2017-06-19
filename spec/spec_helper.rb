require 'serverspec'

set :backend, :exec
set_property conf_dir: File.expand_path('../../config/', __FILE__)