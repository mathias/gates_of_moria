def prepare_input(text)
  text.chomp + "\n"
end

def massage_pattern(text)
  Regexp.new(Regexp.escape(text.strip.tr_s(" \r\n\t", " ")).gsub('\ ', '\s+'))
end
