require 'rails_helper'

RSpec.describe 'Weather Service' do
  it 'returns weather data for a location', :vcr do
    latitude = 39.390897
    longitude = -99.066067
    search = WeatherService.get_forecast(latitude, longitude)

    expect(search).to be_a Hash
    expect(search).to have_key :daily
    expect(search[:daily]).to be_a Array

    expect(search[:daily].first).to have_key :dt
    expect(search[:daily].first[:dt]).to be_a Integer

    expect(search[:daily].first).to have_key :sunrise
    expect(search[:daily].first[:sunrise]).to be_a Integer

    expect(search[:daily].first).to have_key :sunset
    expect(search[:daily].first[:sunset]).to be_a Integer

    expect(search[:daily].first).to have_key :temp
    expect(search[:daily].first[:temp]).to be_a Hash

    expect(search[:daily].first[:temp]).to have_key :min
    expect(search[:daily].first[:temp][:min]).to be_a Float

    expect(search[:daily].first[:temp]).to have_key :max
    expect(search[:daily].first[:temp][:max]).to be_a Float

    expect(search[:daily].first).to have_key :feels_like
    expect(search[:daily].first[:feels_like]).to be_a Hash

    expect(search[:daily].first[:feels_like]).to have_key :day
    expect(search[:daily].first[:feels_like][:day]).to be_a Float

    expect(search[:daily].first[:feels_like]).to have_key :night
    expect(search[:daily].first[:feels_like][:night]).to be_a Float

    expect(search[:daily].first).to have_key :weather
    expect(search[:daily].first[:weather]).to be_an Array

    expect(search[:daily].first[:weather].first).to have_key :description
    expect(search[:daily].first[:weather].first[:description]).to be_a String
  end
end
