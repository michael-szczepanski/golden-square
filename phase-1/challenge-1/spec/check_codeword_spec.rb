require './lib/check_codeword.rb'

RSpec.describe 'check_codeword' do
  it 'returns "Correct! Come in." when given "horse"' do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end

  it 'returns "Close, but nope." when given "here"' do
    result = check_codeword("here")
    expect(result).to eq "Close, but nope."
  end

  it 'returns "WRONG!" when given "there"' do
    result = check_codeword("there")
    expect(result).to eq "WRONG!"
  end
end