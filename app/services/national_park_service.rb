class NationalParkService
  def self.conn
    url = 'https://developer.nps.gov/api/v1/'
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

  def self.find_one_park(park_code)
    response = conn.get('parks') do |faraday|
      faraday.params['parkCode'] = park_code
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_all_park_events(park_code,start,finish)
    response = conn.get('events') do |faraday|
      faraday.params['parkCode'] = park_code
      faraday.params['dateStart'] = start
      faraday.params['dateEnd'] = finish
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_single_event(event_code)
    response = conn.get('events') do |faraday|
      faraday.params['id'] = event_code
    end
    
    JSON.parse(response.body, symbolize_names: true)
  end
end
