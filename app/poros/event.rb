class Event
  attr_reader :location, :description, :name, :date, :time, :free, :id, :fee_info, :latitude, :longitude, :type_of_event, :event_code

  def initialize(data)
    @location = blank_location(data)
    @description = data[:description]
    @name = data[:title]
    @date = data[:dates] #iterate
    @time = formatted_time(data[:times])
    @free = data[:isfree]
    @event_code = data[:id]
    @fee_info = blank_event(data)
    @latitude = data[:latitude]
    @longitude = data[:longitude]
    @type_of_event = data[:types] #iterate
  end

  def blank_event(data)
    if data[:feeinfo] == nil || data[:feeinfo] == ""
      @fee_info = "No fee information available."
    else 
      @fee_info = data[:feeinfo]
    end
  end

  def blank_location(data)
    if data[:location] == nil || data[:location] == ""
      @location = "No location information available."
    else 
      @location = data[:location]
    end
  end

  def formatted_time(data)
    time_start_and_end = []
    data[0].each do |k, v|
      time_start_and_end << v
    end
    time_start_and_end = time_start_and_end[0..-3]
    time_start_and_end
  end
end
