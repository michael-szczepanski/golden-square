#require 'diary_entry'

class Diary
  def initialize
    @diary = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    fail 'not a valid DiaryEntry' unless entry.is_a? DiaryEntry
    @diary << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    return @diary
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    word_count = 0
    @diary.each do |entry|
      word_count += entry.count_words
    end
    return word_count
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    fail 'wpm needs to be an integer' unless wpm.is_a? Integer
    total_time = 0
    @diary.each do |entry|
      total_time += entry.reading_time(wpm)
    end
    return total_time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    fail 'wpm needs to be an integer' unless wpm.is_a? Integer
    fail 'minutes needs to be an integer' unless minutes.is_a? Integer
    best_entry = nil
    minutes_left = minutes
    @diary.each do |entry|
      minutes_left_entry = minutes - entry.reading_time(wpm)
      if (minutes_left_entry >= 0 && minutes_left_entry < minutes_left)
        best_entry = entry
      end
    end
    return best_entry
  end
end
