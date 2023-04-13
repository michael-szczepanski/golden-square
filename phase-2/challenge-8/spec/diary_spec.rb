require 'diary'

RSpec.describe Diary do
  it 'initializes' do
    diary = Diary.new
    expect(
      diary.is_a? Diary
    ).to eq true
  end
end