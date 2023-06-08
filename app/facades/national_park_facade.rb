class NationalParkFacade
  def self.get_parks_by_state(state)
    search = NationalParkService.parks_by_state(state)
    parks = search[:data]
    parks.map do |park|
      Park.new(park)
    end
  end

  def self.one_park(park_code)
    single_park = NationalParkService.find_one_park(park_code)
    park = single_park[:data][0]
    Park.new(park)
  end
end
