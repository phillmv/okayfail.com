BIBREGEX = /\\bibitem{(\^)*(?<name>.*)}/
HREFREGEX = /\\href{(?<url>.*)}{(?<name>.*)}/

offset = 0
new_bib = []
lines.size.times do |index|
  cursor = index + offset
  name = nil

  break if lines[cursor].nil?

  if match = is_bib?(lines[cursor])
    name = "^#{match[:name]}"

    new_line = lines[cursor].gsub(BIBREGEX, "[#{name}]: ").strip

    cursor+=1
    body = lines[cursor]
    if !is_bib?(body) # fetch next line

      body = body.gsub('\%', "%")
      body = body.gsub('\&', "&")

      while match = is_link?(body)
        body = body.gsub(match.to_s, "<a href=\"#{match[:url]}\">#{match[:name]}</a>")
      end

      new_bib << [new_line, body.strip].join(" ")
      offset += 1
    end
  else
    new_bib << lines[cursor]&.strip
  end
end

def is_bib?(line)
  line && line.match(BIBREGEX)
end

def is_link?(line)
  line && line.match(HREFREGEX)
end

def fetch_name(line)
  if match = is_bib?(line)
    name = "^#{match[:name]}"
  end
end
