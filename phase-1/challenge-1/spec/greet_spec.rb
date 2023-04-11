require 'greet'

describe 'greet' do
  it 'returns "Hello, Michael! when given "Michael"' do
    result = greet("Michael")
    expect(result).to eq "Hello, Michael!"
  end
end