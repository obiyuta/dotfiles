define :ln do
  name = params[:name]
  dotfile = File.join(ENV['HOME'], name)
  link dotfile do
    to File.expand_path("../../../config/#{name}", __FILE__)
    not_if "test -e #{dotfile}"
  end
end
