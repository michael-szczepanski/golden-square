require 'diary_entry'

RSpec.describe DiaryEntry do
  context 'initialization' do
    it 'constructs' do
      diary_entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
      expect(
        diary_entry.title
      ).to eq 'Lorem'
    end
    it 'raises an error if title is not a string' do
      expect{
        entry = DiaryEntry.new(1, 'Ipsum Dolor')
      }.to raise_error 'title needs to be a string'
    end

    it 'raises an error if contents is not a string' do
      expect{
        entry = DiaryEntry.new('Lorem', 2)
      }.to raise_error 'contents needs to be a string'
    end
  end

  context 'returns correct title' do
    it 'returns "Lorem" ' do
      entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
      expect(
        entry.title
      ).to eq 'Lorem'
    end
    it 'return "Sit"' do
      entry = DiaryEntry.new('Sit', 'Amet consectetur adipiscing')
      expect(
        entry.title
      ).to eq 'Sit'
    end
  end

  context 'returns correct contents' do
    it 'returns "Ipsum dolor"' do
      entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
      expect(
        entry.contents
      ).to eq 'Ipsum dolor'
    end
    it 'returns "Amet consectetur adipiscing"' do
      entry = DiaryEntry.new('Sit', 'Amet consectetur adipiscing')
      expect(
        entry.contents
      ).to eq 'Amet consectetur adipiscing'
    end
  end

  context 'returns word count' do
    it 'returns correct for 2 words' do
      entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
      expect(
        entry.word_count
      ).to eq 2
    end
    it 'returns correct for 3 words' do
      entry = DiaryEntry.new('Sit', 'Amet consectetur adipiscing')
      expect(
        entry.word_count
      ).to eq 3
    end
  end
end