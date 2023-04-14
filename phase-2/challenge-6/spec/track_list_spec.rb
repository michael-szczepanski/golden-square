require 'track_list'

RSpec.describe TrackList do
  context 'it initializes' do
    it 'creates an empty array correctly' do
      track_list = TrackList.new
      expect(
        track_list.list
      ).to eq []
    end
  end

  it 'correctly adds 1 track to the list' do
    track_list = TrackList.new
    track_list.add('track 1')
    expect(
      track_list.list
    ).to eq ['track 1']
  end

  it 'correctly adds 2 tracks to the list' do
    track_list = TrackList.new
    track_list.add('track 1')
    track_list.add('track 2')
    expect(
      track_list.list
    ).to eq ['track 1', 'track 2']
  end

  context 'raises "track needs to be a string" error' do
    it 'fails' do
      track_list = TrackList.new
      expect{
        track_list.add(['track 1'])
      }.to raise_error 'track needs to be a string'
    end
  end
end