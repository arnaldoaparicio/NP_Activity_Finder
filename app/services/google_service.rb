class GoogleService

    def self.conn
        url = 'https://maps.googleapis.com/maps/api/'
        Faraday.new(url: url) do |faraday|
            faraday.params['key'] = ENV['google_key']
        end
    end

    def self.get_lat_long(address)
        response = conn.get('geocode/json?') do |faraday|
            faraday.params['address'] = address
        end
        JSON.parse(response.body, symbolize_names: true)
        # binding.pry
    end
end