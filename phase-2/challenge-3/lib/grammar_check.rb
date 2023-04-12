def grammar_check(string)
  fail "text needs to be a string" unless string.is_a? String

  capital = string[0] == string[0].upcase
  punctuation = string[-1].match?(/[.?!]/)

  return capital && punctuation
end