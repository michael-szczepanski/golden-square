class Track
  def initialize(title, artist) # title and artist are both strings
    fail 'title needs to be a string' unless title.is_a? String
    fail 'artist needs to be a string' unless artist.is_a? String
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    # Returns true if the keyword matches either the title or artist
    fail 'keyword needs to be a string' unless keyword.is_a? String
    return @title.match?(keyword) || @artist.match?(keyword)
  end

  def title
    return @title
  end
  
  def artist
    return @artist
  end
end