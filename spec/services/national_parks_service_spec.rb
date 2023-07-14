require 'rails_helper'
require 'pry'

RSpec.describe NationalParkService do
  it 'returns all parks in a given state', :vcr do
    state = 'MD'

    search = NationalParkService.parks_by_state(state)
    expect(search).to be_a Hash

    expect(search).to have_key :data

    expect(search[:data].first).to have_key :fullName
    expect(search[:data].first[:fullName]).to be_a String

    expect(search[:data].first).to have_key :description
    expect(search[:data].first[:description]).to be_a String

    expect(search[:data].first).to have_key :parkCode
    expect(search[:data].first[:parkCode]).to be_a String

    expect(search[:data].first).to have_key :latitude
    expect(search[:data].first[:latitude]).to be_a String

    expect(search[:data].first).to have_key :longitude
    expect(search[:data].first[:longitude]).to be_a String

    expect(search[:data].first[:contacts][:phoneNumbers].first).to have_key :phoneNumber
    expect(search[:data].first[:contacts][:phoneNumbers].first[:phoneNumber]).to be_a String

    expect(search[:data].first[:contacts][:emailAddresses].first).to have_key :emailAddress
    expect(search[:data].first[:contacts][:emailAddresses].first[:emailAddress]).to be_a String

    expect(search[:data].first).to have_key :entranceFees
    expect(search[:data].first[:entranceFees]).to be_an Array

    expect(search[:data].first).to have_key :directionsUrl
    expect(search[:data].first[:directionsUrl]).to be_a String

    expect(search[:data].first[:operatingHours].first).to have_key :description
    expect(search[:data].first[:operatingHours].first[:description]).to be_a String

    expect(search[:data].first[:operatingHours].first).to have_key :standardHours
    expect(search[:data].first[:operatingHours].first[:standardHours]).to be_an Hash

    search[:data].first[:addresses].each do |text|
      expect(text).to have_key :line1
      expect(text[:line1]).to be_a String

      expect(text).to have_key :city
      expect(text[:city]).to be_a String

      expect(text).to have_key :stateCode
      expect(text[:stateCode]).to be_a String

      expect(text).to have_key :postalCode
      expect(text[:postalCode]).to be_a String
    end

    expect(search[:data].first).to have_key :images
    expect(search[:data].first[:images]).to be_an Array
  end

  it 'returns all events', :vcr do
    park_code = 'cajo'
    start = Date.today.to_s
    finish = (Date.today + 7).to_s

    events = NationalParkService.find_all_park_events(park_code, start, finish)
    expect(events).to be_a Hash
  end

  it 'returns amenities', :vcr do
    amenities = NationalParkService.get_amenities
    expect(amenities).to be_a Hash
  end

  it 'returns places by accessibility', :vcr do
    search = 'Wheelchair Accessible'
    search_new = "%22#{search}%22"
    park_code = 'acad'
    places = NationalParkService.get_places_by_accessibility(search_new, park_code)
    expect(places).to be_a Hash
  end

  it 'returns alerts for National Gateway Park in NJ', :vcr do
    park_code = 'gate'
    state = 'NJ'

    alerts = NationalParkService.all_alerts(park_code, state)

    require 'pry'
    binding.pry
    expect(alerts).to be_a Hash
  end
end
