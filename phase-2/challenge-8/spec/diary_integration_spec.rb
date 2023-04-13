require 'diary'

RSpec.describe 'Diary integration' do
  context 'all method' do
    it 'displays correct array with no entries' do
      diary = Diary.new
      expect(
        diary.all
      ).to eq []
    end

    it 'displays correct arrray with 2 entries' do
      diary = Diary.new
      entry1 = DiaryEntry.new("Lorem", "Ipsum Dolor")
      entry2 = DiaryEntry.new("Dolor", "Ipsum Lorem")
      diary.add(entry1)
      diary.add(entry2)
      expect(
        diary.all
      ).to eq [entry1, entry2]
    end
  end

  context 'add method' do
    it 'fails if entry is not a DiaryEntry' do
      diary = Diary.new
      expect {
        diary.add("DiaryEntry")
      }.to raise_error 'not a valid DiaryEntry'
    end

    it 'successfully adds an entry' do
      diary = Diary.new
      entry = DiaryEntry.new("Lorem", "Ipsum Dolor")
      diary.add(entry)
      expect(
        diary.all
      ).to eq [entry]
    end
  end

  context 'count_words method' do
    it 'counts correctly for 1 entry in diary' do
      diary = Diary.new
      entry = DiaryEntry.new("Lorem", "Ipsum Dolor")
      diary.add(entry)
      expect(
        diary.count_words
      ).to eq 2
    end

    it 'counts correctly for 2 entries in diary' do
      diary = Diary.new
      entry1 = DiaryEntry.new("Lorem", "Ipsum Dolor")
      entry2 = DiaryEntry.new("Dolor", "Ipsum Lorem")
      diary.add(entry1)
      diary.add(entry2)
      expect(
        diary.count_words
      ).to eq 4
    end
  end

  context 'reading_time method' do
    it 'fails for non-integer input' do
      diary = Diary.new
      entry = DiaryEntry.new("Lorem", "Ipsum Dolor")
      diary.add(entry)
      expect {
        diary.reading_time("one")
      }.to raise_error 'wpm needs to be an integer'
    end

    it 'gives correct result for 1 entry' do
      diary = Diary.new
      entry = DiaryEntry.new("Lorem", "Ipsum Dolor")
      diary.add(entry)
      expect(
        diary.reading_time(2)
      ).to eq 1
    end

    it 'gives correct result for 2 entries' do
      diary = Diary.new
      entry1 = DiaryEntry.new("Lorem", "Ipsum Dolor")
      entry2 = DiaryEntry.new("Dolor", "Ipsum Lorem")
      diary.add(entry1)
      diary.add(entry2)
      expect(
        diary.reading_time(1)
      ).to eq 4
    end
  end

  context 'find_best_entry_for_reading_time method' do
    it 'fails if wpm is non-integer' do
      diary = Diary.new
      expect {
        diary.find_best_entry_for_reading_time("one", 1)
      }.to raise_error 'wpm needs to be an integer'
    end

    it 'fails if minutes is non-integer' do
      diary = Diary.new
      expect {
        diary.find_best_entry_for_reading_time(1, "one")
      }.to raise_error 'minutes needs to be an integer'
    end

    it 'returns correct entry for wpm=1 minutes=2' do
      diary = Diary.new
      entry1 = DiaryEntry.new("Lorem", "Ipsum Dolor")
      entry2 = DiaryEntry.new("Dolor", "Ipsum Lorem Ipsum Dolor")
      diary.add(entry1)
      diary.add(entry2)
      expect(
        diary.find_best_entry_for_reading_time(1, 3)
      ).to eq entry1
    end

    it 'returns correct entry for wpm=1 minutes=4' do
      diary = Diary.new
      entry1 = DiaryEntry.new("Lorem", "Ipsum Dolor")
      entry2 = DiaryEntry.new("Dolor", "Ipsum Lorem Ipsum Dolor")
      diary.add(entry1)
      diary.add(entry2)
      expect(
        diary.find_best_entry_for_reading_time(1, 4)
      ).to eq entry2
    end
  end
end