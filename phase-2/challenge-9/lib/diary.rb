require 'diary_entry'
require 'phonebook'

class Diary
  def initialize
    @entry_list = []
  end

  def add_entry(entry)
    # Adds DiaryEntry entry to list
    # Returns nothing
    fail 'entry needs to be a DiaryEntry' unless entry.is_a? DiaryEntry
    @entry_list << entry
  end

  def list_entries
    # Returns a list of all entries
    return @entry_list
  end

  def list_specific_entries(wpm, minutes)
    # Takes integers for word per minute speed and minutes
    # Returns a list of only the entries which can be read in a given time at given speed
    fail 'wpm needs to be an integer' unless wpm.is_a? Integer
    fail 'minutes needs to be an integer' unless minutes.is_a? Integer
    entries_selected = []
    words_read = wpm * minutes
    @entry_list.each do |entry|
      entries_selected << entry if entry.word_count <= words_read
    end
    return entries_selected
  end

  def list_phone_numbers
    # Returns a list of numbers found in all entries
    # Uses PhoneBook class to extract the numbers
    phonebook = PhoneBook.new
    return phonebook.extract_numbers(@entry_list)
  end
end
