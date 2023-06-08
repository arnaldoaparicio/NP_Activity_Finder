require 'rails_helper'
require 'pry'

RSpec.describe NationalParkService do
  it 'returns all parks in a given state' do
    state = 'MD'

    search = NationalParkService.parks_by_state(state)
    expect(search).to be_a Hash
  end

  it 'returns all events' do
    park_code = 'cajo'
    start = Date.today.to_s
    finish = (Date.today + 7).to_s

    events = NationalParkService.find_all_park_events(park_code, start, finish)
    expect(events).to be_a Hash
  end
end
