require 'string_repeater'

RSpec.describe StringRepeater do
  it 'repeats string correctly' do
    io_dbl = double :Kernel
    expect(io_dbl).to receive(:puts).with("Hello. I will repeat a string many times.\nPlease enter a string")
    expect(io_dbl).to receive(:gets).and_return("TWIX")
    expect(io_dbl).to receive(:puts).with("Please enter a number of repeats")
    expect(io_dbl).to receive(:gets).and_return("10")
    expect(io_dbl).to receive(:puts).with("Here is your result:\nTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")

    string_repeater = StringRepeater.new(io_dbl)
    string_repeater.run
  end
  it 'fails for non-integer repeats input' do
    io_dbl = double :Kernel
    expect(io_dbl).to receive(:puts).with("Hello. I will repeat a string many times.\nPlease enter a string")
    expect(io_dbl).to receive(:gets).and_return("TWIX")
    expect(io_dbl).to receive(:puts).with("Please enter a number of repeats")
    expect(io_dbl).to receive(:gets).and_return("ten")
    
    string_repeater = StringRepeater.new(io_dbl)
    expect { string_repeater.run }
      .to raise_error "number needs to be an integer"
  end
end