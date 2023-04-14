class TrackList
  def initialize
    @track_list = []
  end

  def list
    return @track_list
  end

  def add(track)
    fail 'track needs to be a string' unless track.is_a? String
    @track_list << track
  end
end