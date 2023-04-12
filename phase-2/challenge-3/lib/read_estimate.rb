def read_estimate(string)
  fail "text needs to be a string" unless string.is_a? String

  wpm = 2 # 200 will be used post testing
  return string.split(" ").size/wpm
end