require './lib/make_snippet.rb'

describe 'make_snippet' do
  it 'returns "one two three" if given "one two three"' do
    expect(make_snippet("one two three")).to eq "one two three"
  end
end