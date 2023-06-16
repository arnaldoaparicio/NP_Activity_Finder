require 'rails_helper'
require 'pry'
require 'date'

RSpec.describe NationalParkFacade do
  it 'returns parks by state code' do
    state = 'md'
    search = NationalParkFacade.get_parks_by_state(state)
    expect(search).to be_a Array
  end

  it 'returns events by park code' do
    park_code = 'shen'
    start = Date.today.to_s
    finish = (Date.today + 7).to_s

    search = NationalParkFacade.all_park_events(park_code, start, finish)
  end
end
