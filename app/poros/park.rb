class Park
  attr_reader :name, :description, :park_code, :latitude, :longitude, :phone_number, :email, :entrance_fees,
              :directions_website, :closed_day, :operating_hours, :address, :photos

  def initialize(data)

    @name = data[:fullName]
    @description = data[:description]
    @park_code = data[:parkCode]
    @latitude = data[:latitude]
    @longitude = data[:longitude]
    @phone_number = formatted_phone_number(data[:contacts][:phoneNumbers])
    @email = data[:contacts][:emailAddresses].first[:emailAddress]
    @entrance_fees = formatted_entrance_fees(data[:entranceFees])
    @directions_website = data[:directionsUrl]
    @closed_day = blank_closed_day(data[:operatingHours])
    @operating_hours = formatted_operating_hours(data[:operatingHours]) # iterate through
    @address = formatted_address(data)
    @photos = formatted_photos(data[:images]) # iterate through
  end

  def formatted_phone_number(number)
    return nil if number.empty?

    number.first[:phoneNumber]
  end

  def formatted_address(data)
    # address = data[:addresses].first[:line1]
    # if address.include? "|"
    #   address = address.gsub("|", ",")
    # end
    # address
    "#{data[:addresses].first[:line1]}, #{data[:addresses].first[:city]}, #{data[:addresses].first[:stateCode]} #{data[:addresses].first[:postalCode]}"
  end

  def formatted_operating_hours(data)
    days = [['Monday'], ['Tuesday'], ['Wednesday'], ['Thursday'], ['Friday'], ['Saturday'], ['Sunday']]

    if data == []
        "No information available"
    else
      days.each do |day|
        data.first[:standardHours].each do |k, v|
          if day[0].downcase == k.to_s
            day << v
          end
        end
      end
    end
    days
  end

  def formatted_photos(data)
    array = []
    data.each do |d|
      array << [d[:url], d[:altText]]
    end

    if array.empty?
      array << "No photos available"
    else 
      array
    end
  end

  def formatted_entrance_fees(data)
    array = []
    if data.empty?
      [['0', 'No pricing available']]
    else
      data.each do |d|
        array << [d[:cost], d[:description]]
      end
      array
    end
  end

  def blank_closed_day(data)
    if data == []
      'No information available'
    else
      data.first[:description]
    end
  end
end
