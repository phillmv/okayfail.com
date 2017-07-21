require 'ostruct'
###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :site_url, "http://okayfail.com"

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

azulejo_data ||= YAML.load_file("data/azulejos.yml")

azulejo_data[:azulejo].each do |jpg, hsh|
  path = "/2017/azulejos/#{jpg.gsub("jpg", "html")}"
  proxy path, 'views/azulejos/try.html', layout: "azulejo", locals: {
    title: hsh[:saints].map { |s| azulejo_data[:names][s.to_sym] }.join(" and "),
    filename: jpg,
    street: hsh[:street],
    saints: hsh[:saints]
  }
end
# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "{year}/{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

configure :development do
  activate :livereload
end

helpers do

  def link_to_azulejo(jpg)
    "/2017/azulejos/#{jpg.gsub("jpg", "html")}"
  end

  def saint_name(sym)
    data.azulejos["names"][sym]
  end

  def azulejos_by_saint
    data.azulejos[:azulejo].reduce({}) { |h, (f, sh)| 
      (sh[:saints] || []).each { |s| 
        h[s] ||= []; 
        h[s] << f 
      }; 
      h 
    }
  end
end
