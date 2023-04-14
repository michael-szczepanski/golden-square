require 'diary'

RSpec.describe Diary do
  context 'initialization' do
    it 'constructs' do
      diary = Diary.new
      expect(
        diary.list_entries
      ).to eq []
    end
  end
end