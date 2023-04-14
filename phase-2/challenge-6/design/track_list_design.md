## Describe
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## Design
class TrackList
@track_list: arrray

def initialize: initializes with no arguments and creates the empty array
def add(track): track given in the form of a string, returns nothing, raises errors for non-string arguments
def list: return the @track_list

## Examples
```
track_list = TrackList.new
track_list.list # => []

track_list = TrackList.new
track_list.add('track 1')
track_list.list # => ['track 1']

track_list = TrackList.new
track_list.add('track 1')
track_list.add('track 2')
track_list.list # => ['track 1', 'track 2']

track_list = TrackList.new
track_list.add(['track 1']) # => 'track needs to be a string'
```