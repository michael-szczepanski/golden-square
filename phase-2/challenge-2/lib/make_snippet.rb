def make_snippet(string)
  return "Not a string" if !string.instance_of? String
  string_arr = string.split(" ")
  snippet = string_arr.slice(0..4).join(" ")
  if string_arr.size > 5
    snippet << "..."
  end

  return snippet
end