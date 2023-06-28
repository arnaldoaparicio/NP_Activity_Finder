class MapService

    def self.conn
        url = 'https://www.mapquestapi.com/search/v4/'
        Faraday.new(url: url) do |faraday|
            faraday.params['key'] = ENV['map_key']
        end
    end

    def self.get_service(location, q, circle, sort)
        response = conn.get('place?') do |faraday|
            faraday.params['location'] = location
            faraday.params['q'] = q
            faraday.params['circle'] = circle
            faraday.params['sort'] = sort
        end
        JSON.parse(response.body, symbolize_names: true)
    end

end