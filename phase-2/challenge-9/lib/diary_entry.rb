class DiaryEntry
  def initialize(title, contents)
    # Creates title and contents variables and stores corresponding arguments
    fail 'contents needs to be a string' unless contents.is_a? String
    fail 'title needs to be a string' unless title.is_a? String
    @title = title
    @contents = contents
  end

  def title
    # Returns title
    return @title
  end

  def contents
    # Returns contents
    return @contents
  end

  def word_count
    # Returns word count
    return @contents.split(" ").size
  end
end