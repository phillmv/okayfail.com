CITEREGEX = /\\cite{(\^)*(?<name>[^}]*)}/

text = File.read("source/posts/2018-09-25-rent-control-test.html.markdown.erb")

while match = text.match(CITEREGEX)
  text = text.gsub(match.to_s, "[^#{match[:name]}]");
end
