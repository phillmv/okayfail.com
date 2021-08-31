require 'yaml'
require 'erb'
require 'fileutils'

azulejo_data = YAML.load_file("azulejos.yml")
azulejo_show = ERB.new(File.read("azulejo_show.html.erb"))
@azulejo_grid = ERB.new(File.read("azulejo_grid.html.erb"))

def render_saint(s)
  File.read("partials/_#{s}.html")
end

def render_grid(azulejos)
  @azulejo_grid.result(binding)
end

FileUtils.mkdir_p("output")

azulejo_data[:azulejo].each do |jpg, hsh|
  street = hsh[:street]
  saints = hsh[:saints]
  title = saints.map { |s| azulejo_data[:names][s.to_sym] }.join(" and ")
  filename = jpg

  related = saints.map { |s| azulejo_data[:saints][s] }.flatten.reject { |f, a| f == filename }


  File.write("output/#{jpg.gsub("jpg", "html")}", azulejo_show.result(binding))

  # path = "/2017/saints-of-little-portugal/#{jpg.gsub("jpg", "html")}"
  # proxy path, '/posts/2017-07-19-saints-of-little-portugal/show.html', locals: {
  #   title: hsh[:saints].map { |s| azulejo_data[:names][s.to_sym] }.join(" and "),
  #   filename: jpg,
  #   street: hsh[:street],
  #   saints: hsh[:saints]
  # }, :ignore => true
end

