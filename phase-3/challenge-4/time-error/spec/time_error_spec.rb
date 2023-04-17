require 'time_error'

RSpec.describe TimeError do
  it 'returns a correct time error value' do
    requester_dbl = double :requester
    time = '2023-04-17 10:50:45.557533 +0100'
    
    expect(requester_dbl)
      .to receive(:get)
      .with(URI("https://worldtimeapi.org/api/ip"))
      .and_return('{"abbreviation":"BST","client_ip":"82.163.117.26","datetime":"2023-04-17T10:34:47.415222+01:00","day_of_week":1,"day_of_year":107,"dst":true,"dst_from":"2023-03-26T01:00:00+00:00","dst_offset":3600,"dst_until":"2023-10-29T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1681724087,"utc_datetime":"2023-04-17T09:34:47.415222+00:00","utc_offset":"+01:00","week_number":16}')


    time_error = TimeError.new(requester_dbl, time)
    expect(
      time_error.error
    ).to eq -958.142311
  end
end