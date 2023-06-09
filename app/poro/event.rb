class Event

  attr_reader :location, :description, :name, :date, :time, :free, :id, :fee_info, :latitude, :longitude, :type

  def initialize(data)

    @location = data[:location]
    @description = data[:description]
    @name = data[:title]
    @date = data[:dates] #iterate
    @time = data[:times] #iterate
    @free = data[:isfree]
    @id = data[:id]
    @fee_info = data[:feeinfo]
    @latitude = data[:latitude]
    @longitude = data[:longitude]
    @type = data[:types] #iterate
  end
  
end