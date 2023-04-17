class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers.\nPlease enter a number"
    number_1 = @io.gets.chomp
    @io.puts "Please enter another number"
    number_2 = @io.gets.chomp
    @io.puts "Here is your result:\n#{number_1} - #{number_2} = #{number_1.to_i - number_2.to_i}"
  end
end

#interactive_calculator = InteractiveCalculator.new(Kernel)
#interactive_calculator.run