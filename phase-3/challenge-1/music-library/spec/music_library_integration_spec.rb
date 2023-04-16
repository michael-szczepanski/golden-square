require 'music_library'

RSpec.describe 'MusicLibrary integration' do
  context 'it returns a list of search matches' do
    it 'works for a single match' do
      music_library = MusicLibrary.new
      track_1 = double :Track, matches?: true
      track_2 = double :Track, matches?: false
      music_library.add(track_1)
      music_library.add(track_2)
      expect(
        music_library.search('keyword')
      ).to eq [track_1]
    end

    it 'works for a multiple matches' do
      music_library = MusicLibrary.new
      track_1 = double :Track, matches?: true
      track_2 = double :Track, matches?: false
      track_3 = double :Track, matches?: true
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      expect(
        music_library.search('keyword')
      ).to eq [track_1, track_3]
    end
  end
end