require 'rails_helper'
require 'pry'
require 'date'

RSpec.describe NationalParkFacade do
  it 'returns parks by state code', :vcr do
    state = 'md'
    search = NationalParkFacade.get_parks_by_state(state)
    expect(search).to be_a Array

    search.each do |s|
      expect(s).to be_a Park
    end
  end

  it 'returns events by park code', :vcr do
    park_code = 'shen'
    start = Date.today.to_s
    finish = (Date.today + 7).to_s

    search = NationalParkFacade.all_park_events(park_code, start, finish)

    search.each do |s|
      expect(s).to be_an Event
    end
  end

  it 'returns one park by park code', :vcr do
    park_code = 'shen'
    single_park = NationalParkService.find_one_park(park_code)

    park = Park.new(single_park[:data][0])

    expect(park).to be_a Park
  end
end
