class Diary
  def initialize(contents) # contents is a string
    fail 'contents needs to be a string' unless contents.is_a? String
    @contents = contents
  end

  def read
    # Returns the contents of the diary
    @contents
  end
end