require './lib/string_builder.rb'

RSpec.describe StringBuilder do
  it 'returns 5 when added "strin" and called method size' do
    string = StringBuilder.new
    string.add("strin")
    result = string.size
    expect(result).to eq 5
  end

  it 'outputs "str" when added "str"' do
    string = StringBuilder.new
    string.add("str")
    result = string.output
    expect(result).to eq "str"
  end
end