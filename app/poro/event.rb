class Event

  attr_reader :location, :description, :name, :date, :time, :free, :id, :fee_info, :latitude, :longitude, :type

  def initialize(data)

    @location = blank_location(data)
    @description = data[:description]
    @name = data[:title]
    @date = data[:dates] #iterate
    @time = data[:times] #iterate
    @free = data[:isfree]
    @id = data[:id]
    # @fee_info = data[:feeinfo]
    @fee_info = blank_event(data)
    @latitude = data[:latitude]
    @longitude = data[:longitude]
    @type = data[:types] #iterate
  end

  def blank_event(data)
    if @fee_info == nil
      @fee_info = "No fee information available."
    else 
      @fee_info = data[:feeinfo]
    end
  end

  def blank_location(data)
    if @location == nil
      @location = "No location information available."
    else 
      @location = data[:location]
    end
  end
  
end