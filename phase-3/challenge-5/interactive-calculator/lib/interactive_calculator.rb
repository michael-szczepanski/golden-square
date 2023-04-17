class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers.\nPlease enter a number"
    number_1 = get_number
    @io.puts "Please enter another number"
    number_2 = get_number
    @io.puts "Here is your result:\n#{number_1} - #{number_2} = #{number_1.to_i - number_2.to_i}"
  end

  def get_number
    number = @io.gets.chomp
    fail "number needs to be a string" unless number.to_i.to_s == number
    return number 
  end
end

#interactive_calculator = InteractiveCalculator.new(Kernel)
#interactive_calculator.run