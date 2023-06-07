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
    @entrance_fees = data[:entranceFees] # iterate through
    @directions_website = data[:directionsUrl]
    @closed_day = data[:operatingHours].first[:description]
    @operating_hours = data[:operatingHours].first[:standardHours] # iterate through
    @address = data[:addresses].first[:line1] + ', ' + data[:addresses].first[:city] + ', ' + data[:addresses].first[:stateCode] + ' ' + data[:addresses].first[:postalCode]
    @photos = data[:images] # iterate through
  end

  def formatted_phone_number(number)
    return nil if number.empty?
    return number.first[:phoneNumber]
  end
end
