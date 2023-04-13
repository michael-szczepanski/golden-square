require 'get_most_common_letter'

RSpec.describe 'get_most_common_letter' do
  it 'should return correct letter' do
    expect(
      get_most_common_letter("the roof, the roof, the roof is on fire!")
    ).to eq "o"
  end
end