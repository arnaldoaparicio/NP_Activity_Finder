class NationalParkFacade
  def self.get_parks_by_state(state)
    search = NationalParkService.parks_by_state(state)

    search[:data].map do |park|
      Park.new(park)
    end
  end

  def self.one_park(park_code)
    single_park = NationalParkService.find_one_park(park_code)

    park = single_park[:data][0]
    Park.new(park)
  end

  def self.all_park_events(park_code, start, finish)
    park_events = NationalParkService.find_all_park_events(park_code, start, finish)[:data]
    park_events.map do |event|
      Event.new(event)
    end
  end

  def self.get_single_event(event_code)
    single_event = NationalParkService.get_single_event(event_code)
    event = single_event[:data][0]
    Event.new(event)
  end

  def self.get_amenities
    amenities = NationalParkService.get_amenities[:data]
    amenities.map do |amenity|
      Amenity.new(amenity)
    end
  end

  def self.get_places_by_accessibility(search,park_code)
    places = NationalParkService.get_places_by_accessibility(search,park_code)[:data]
    # binding.pry
    places.map do |place|
      AccessiblePlace.new(place)
    end
  end
end
