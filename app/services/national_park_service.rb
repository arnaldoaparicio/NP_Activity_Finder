class NationalParkService

    def self.conn 
        url = "https://developer.nps.gov/api/v1/"
        Faraday.new(url: url) do |faraday|
            faraday.params['api_key'] = ENV['parks_key']
        end

    end

    def self.parks_by_state(state)
        response = conn.get('parks') do |faraday|
         faraday.params['stateCode'] = state
        end
        JSON.parse(response.body, symbolize_names: true)
    end

end