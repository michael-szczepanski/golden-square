require 'date'
require 'json'
require 'net/http'

class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer
  def initialize(requester, time)
    # time to be set as nil if not testing
    @time = time
    @requester = requester
  end

  def error
    return get_server_time - (@time == nil ? Time.now : Time.new(@time))
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

#time_error = TimeError.new(Net::HTTP, nil)
#p time_error.error