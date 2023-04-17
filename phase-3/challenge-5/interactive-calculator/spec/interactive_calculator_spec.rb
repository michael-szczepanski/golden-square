require 'interactive_calculator'

RSpec.describe InteractiveCalculator do
  it 'returns correct values' do
    io_dbl = double :io
    expect(io_dbl).to receive(:puts).with("Hello. I will subtract two numbers.\nPlease enter a number")
    expect(io_dbl).to receive(:gets).and_return('4')
    expect(io_dbl).to receive(:puts).with("Please enter another number")
    expect(io_dbl).to receive(:gets).and_return('3')
    expect(io_dbl).to receive(:puts).with("Here is your result:\n4 - 3 = 1")

    interactive_calculator = InteractiveCalculator.new(io_dbl)
    interactive_calculator.run
  end
end