require 'track'

RSpec.describe Track do
  context 'it constructs' do
    it 'it constructs correctly' do
      track = Track.new('title', 'artist')
      expect(track.title).to eq 'title'
      expect(track.artist).to eq 'artist'
    end
    it 'raises "title needs to be a string" error' do
      expect{
        Track.new([], 'artist')
      }.to raise_error "title needs to be a string"
    end
    it 'raises "artist needs to be a string" error' do
      expect{
        Track.new('title', [])
      }.to raise_error "artist needs to be a string"
    end
  end

  context 'it correctly matches?' do
    track_1 = Track.new('title 1', 'artist 1')
    track_2 = Track.new('title 2', 'artist 2')
    it 'raises "keyword needs to be a string" error' do
      expect{
        track_1.matches?([])
      }.to raise_error 'keyword needs to be a string'
    end
    it 'matches title' do
      expect( track_1.matches?('title 1') ).to eq true
      expect( track_2.matches?('title 1') ).to eq false
    end
    it 'matches artist' do
      expect( track_1.matches?('artist 2') ).to eq false
      expect( track_2.matches?('artist 2') ).to eq true
    end
  end
end