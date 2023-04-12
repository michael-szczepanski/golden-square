require 'read_estimate'

RSpec.describe 'read_estimate' do
  it 'returns 1 for "one two"' do
    expect(
      read_estimate("one two")
    ).to eq 1
  end

  it 'returns 2 for "one two three four"' do
    expect(
      read_estimate("one two three four")
    ).to eq 2
  end

  context 'fails if given non string' do
    it 'fails' do
      expect {
        read_estimate(1)
      }.to raise_error(
        "text needs to be a string"
      )
    end
  end
end