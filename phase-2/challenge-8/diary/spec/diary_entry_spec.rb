require 'diary_entry'

RSpec.describe DiaryEntry do
  context 'it initializes correctly' do
    it 'fails on non-string title' do
      expect {
        diary_entry = DiaryEntry.new(1, "contents")
      }.to raise_error 'title must be a string'
    end
    it 'fails on non-string content' do
      expect {
        diary_entry = DiaryEntry.new("title", 1)
      }.to raise_error 'contents must be a string'
    end
  end

  context 'title method' do
    it 'returns title for "title"' do
      diary_entry = DiaryEntry.new("title", "contents")
      expect(
        diary_entry.title
      ).to eq "title"
    end

    it 'returns different title for "different title"' do
      diary_entry = DiaryEntry.new("different title", "contents")
      expect(
        diary_entry.title
      ).to eq "different title"
    end
  end

  context 'contents method' do
    it 'returns contents' do
      diary_entry = DiaryEntry.new("title", "contents")
      expect(
        diary_entry.contents
      ).to eq "contents"
    end
    it 'returns different contents' do
      diary_entry = DiaryEntry.new("title", "different contents")
      expect(
        diary_entry.contents
      ).to eq "different contents"
    end
  end

  context 'word_count method' do
    it 'returns 1 for "Lorem" ' do
      diary_entry = DiaryEntry.new("title", "Lorem")
      expect(
        diary_entry.count_words
      ).to eq 1
    end
    it 'returns 2 for "Lorem Ipsum" ' do
      diary_entry = DiaryEntry.new("title", "Lorem Ipsum")
      expect(
        diary_entry.count_words
      ).to eq 2
    end
  end

  context 'reading_time method' do
    it 'fails if given non-integers' do
      diary_entry = DiaryEntry.new("Lorem", "Ipsum Dolor")
      expect {
        diary_entry.reading_time("one")
      }.to raise_error "wpm needs to be an integer"
    end

    it 'returns 2 for Ipsum Dolor and wpm=1' do
      diary_entry = DiaryEntry.new("Lorem", "Ipsum Dolor")
      expect(
        diary_entry.reading_time(1)
      ).to eq 2
    end

    it 'returns 1 for Ipsum Dolor and wpm=2' do
      diary_entry = DiaryEntry.new("Lorem", "Ipsum Dolor")
      expect(
        diary_entry.reading_time(2)
      ).to eq 1
    end
  end

  context 'reading_chunk method' do
    it 'fails if wpm is non-integer' do
      diary_entry = DiaryEntry.new('Lorem', 'Ipsum Dolor')
      expect {
        diary_entry.reading_chunk('one', 1)
      }.to raise_error 'wpm needs to be an integer'
    end

    it 'fails if minutes is non-integer' do
      diary_entry = DiaryEntry.new('Lorem', 'Ipsum Dolor')
      expect {
        diary_entry.reading_chunk(1, 'one')
      }.to raise_error 'minutes needs to be an integer'
    end

    it 'returns "Lorem" if wpm=1 and minutes=1' do
      diary_entry = DiaryEntry.new('Lorem', 'Ipsum Dolor')
      expect(
        diary_entry.reading_chunk(1, 1)
      ).to eq "Ipsum"
    end

    it 'returns "Lorem Ipsum" if wpm=1 and minutes=2' do
      diary_entry = DiaryEntry.new('Lorem', 'Ipsum Dolor')
      expect(
        diary_entry.reading_chunk(1, 2)
      ).to eq 'Ipsum Dolor'
    end
  end
end