class Business
    attr_reader :name,
                :address,
                :city,
                :state,
                :zip,
                :longitude,
                :latitude
    def initialize(data)
        @name = data[:name]
        @address = data[:place][:properties][:street]
        @city = data[:place][:properties][:city]
        @state = data[:place][:properties][:stateCode]
        @zip = data[:place][:properties][:postalCode]
        @longitude = data[:place][:geometry][:coordinates][0]
        @latitude = data[:place][:geometry][:coordinates][1]
    end




end