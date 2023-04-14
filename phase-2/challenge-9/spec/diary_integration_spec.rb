require 'diary'

RSpec.describe 'Diary integration' do
  context 'it adds entries' do
    it 'raises "entry needs to be a DiaryEntry"' do
      diary = Diary.new
      expect{
        diary.add_entry('entry')
      }.to raise_error 'entry needs to be a DiaryEntry'
    end
    it 'correctly adds 1 entry' do
      diary = Diary.new
      entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
      diary.add_entry(entry)
      expect(
        diary.list_entries
      ).to eq [entry]
    end
    it 'correctly adds 2 entries' do
      diary = Diary.new
      entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
      entry2 = DiaryEntry.new('Sit', 'Amet consectetur adipiscing')
      diary.add_entry(entry)
      diary.add_entry(entry2)
      expect(
        diary.list_entries
      ).to eq [entry,entry2]
    end
  end

  context 'returns limited lists' do
    it 'raises error if wpm is not an integer' do
      diary = Diary.new
      expect{
        diary.list_specific_entries('one', 2)
      }.to raise_error 'wpm needs to be an integer'
    end
    it 'raises error if minutes in not an integer' do
      diary = Diary.new
      expect{
        diary.list_specific_entries(1, 'two')
      }.to raise_error 'minutes needs to be an integer'
    end
    it 'returns correct for wpm=1 and minutes=2' do
      diary = Diary.new
      entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
      entry2 = DiaryEntry.new('Sit', 'Amet consectetur adipiscing')
      entry3 = DiaryEntry.new('Elit', 'Sed do eiusmod tempor')
      diary.add_entry(entry)
      diary.add_entry(entry2)
      diary.add_entry(entry3)
      expect(
        diary.list_specific_entries(1, 2)
      ).to eq [entry]
    end
    it 'returns correct for wpm=1 and minutes=3' do
      diary = Diary.new
      entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
      entry2 = DiaryEntry.new('Sit', 'Amet consectetur adipiscing')
      entry3 = DiaryEntry.new('Elit', 'Sed do eiusmod tempor')
      diary.add_entry(entry)
      diary.add_entry(entry2)
      diary.add_entry(entry3)
      expect(
        diary.list_specific_entries(1, 3)
      ).to eq [entry, entry2]
    end
  end

  context 'returns list of numbers' do
    it 'correctly returns from 1 entry' do
      diary = Diary.new
      entry = DiaryEntry.new('Lorem', 'Ipsum 07789456123 dolor')
      diary.add_entry(entry)
      expect(
        diary.list_phone_numbers
      ).to eq ['07789456123']
    end

    it 'correctly returns from 2 entries' do
      diary = Diary.new
      entry = DiaryEntry.new('Lorem', 'Ipsum 07789456123 dolor')
      entry2 = DiaryEntry.new('Sit', '07123456789 Amet 07456789123 consectetur')
      diary.add_entry(entry)
      diary.add_entry(entry2)
      expect(
        diary.list_phone_numbers
      ).to eq ['07789456123', '07123456789', '07456789123']
    end
  end
end
