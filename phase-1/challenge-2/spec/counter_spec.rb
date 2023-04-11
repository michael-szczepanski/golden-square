require './lib/counter.rb'

RSpec.describe 'Counter' do
  it 'returns "Counted to 8 so far after adding 2 then 6' do
    counter = Counter.new
    counter.add(2)
    counter.add(6)
    result = counter.report
    expect(result).to eq "Counted to 8 so far."
  end

  it 'adds 5 and returns "Counted to 5 so far"' do
    counter = Counter.new
    counter.add(5)
    result = counter.report
    expect(result).to eq "Counted to 5 so far."
  end
end