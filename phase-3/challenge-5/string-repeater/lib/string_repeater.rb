class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will repeat a string many times.\nPlease enter a string"
    string = @io.gets.chomp
    repetitions = get_number
    @io.puts format_string(string, repetitions)
  end

  def get_number
    @io.puts "Please enter a number of repeats"
    number = @io.gets.chomp
    fail "number needs to be an integer" unless number.to_i.to_s == number
    return number.to_i
  end

  def format_string(string, repetitions)
    result = "Here is your result:\n"
    repetitions.times { result << string }
    return result
  end
end

#sr = StringRepeater.new(Kernel)
#sr.run