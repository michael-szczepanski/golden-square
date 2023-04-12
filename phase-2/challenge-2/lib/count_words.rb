def count_words(string)
  # takes a string as an argument and returns the number of words in that string.
  fail "argument cannot be nil" unless !string.nil?
  fail "non-string argument given" unless string.is_a? String

  return string.split(" ").size
end