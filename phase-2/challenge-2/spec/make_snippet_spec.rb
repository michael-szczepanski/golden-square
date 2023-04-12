require './lib/make_snippet.rb'

describe 'make_snippet' do
  it 'returns "one two three" if given "one two three"' do
    expect(make_snippet("one two three")).to eq "one two three"
  end

  it 'returns empty for empty string' do
    expect(make_snippet("")).to eq ""
  end

  it 'returns "Not a string" if given integer' do
    expect(make_snippet(1)).to eq "Not a string"
  end

  it 'returns "o t t f f..." for "o t t f f s"' do
    expect(make_snippet("o t t f f s")).to eq "o t t f f..."
  end
end