class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
    fail 'title must be a string' unless title.is_a? String
    fail 'contents must be a string' unless contents.is_a? String
    @title = title
    @contents = contents
  end

  def title
    # Returns the title as a string
    return @title
  end

  def contents
    # Returns the contents as a string
    return @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    return contents.split(" ").size
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    fail 'wpm needs to be an integer' unless wpm.is_a? Integer
    return count_words / wpm
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    fail 'wpm needs to be an integer' unless wpm.is_a? Integer
    fail 'minutes needs to be an integer' unless minutes.is_a? Integer
    words_read = wpm * minutes
    chunk = @contents.split(" ").slice(0...words_read)
    return chunk.join(" ")
  end
end