require 'yaml'
require 'erb'

data = YAML.load_file("azulejos.yml")

erb = ERB.new(File.read("azulejo_grid.html.erb"))

azulejos = data[:azulejo].keys[0..31]
puts erb.result(binding)

puts "########################"

azulejos = data[:azulejo].keys[32..-1]
puts erb.result(binding)
