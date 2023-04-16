require 'music_library'

RSpec.describe MusicLibrary do
  context 'adds and lists Tracks correctly' do
    it 'returns correctly for empty Track list' do
      music_library = MusicLibrary.new
      expect(
        music_library.all
      ).to eq []
    end
    it 'returns correctly for filled arrays' do
      music_library = MusicLibrary.new
      track_1 = double :Track
      track_2 = double :Track
      music_library.add(track_1)
      music_library.add(track_2)
      expect(
        music_library.all
      ).to eq [track_1, track_2]
    end
  end
end