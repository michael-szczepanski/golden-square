require 'count_words.rb'

describe 'count_words' do
  context 'fails if a non-string argument is passed' do
    it 'fails for not nil' do
      expect{ count_words(2) }.to raise_error "non-string argument given"
    end
    it 'fails for nil' do
      expect { count_words(nil) }.to raise_error "argument cannot be nil"
    end
  end

  it 'returns 3 for "one two three"' do
    result = count_words("one two three")
    expect(result).to eq 3
  end

  it 'returns 2 for "one two"' do
    result = count_words("one two")
    expect(result).to eq 2
  end

  it 'returns 0 for empty string' do
    result = count_words("")
    expect(result).to eq 0
  end
end