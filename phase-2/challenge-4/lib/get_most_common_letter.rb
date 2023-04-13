def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    counter[char] += 1 unless char == " "
  end
  counter_a = counter.to_a
  counter_a.sort_by! { |k, v| v }.reverse!
  return counter_a[0][0]
  p "#{counter_a}"
end