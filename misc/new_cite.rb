CITEREGEX = /\\cite{(\^)*(?<name>[^}]*)}/
ITALIC = /\\emph{(?<content>[^}]+)}/

text = File.read("source/posts/2018-09-25-rent-control-test.html.markdown.erb");

while match = text.match(CITEREGEX)
  text = text.gsub(match.to_s, "[^#{match[:name]}]");
end

while match = text.match(ITALIC)
  text = text.gsub(match.to_s, "_#{match[:content]}_")
end

File.write("source/posts/2018-09-25-rent-control-test.html.markdown.erb", text)
