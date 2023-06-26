require 'rails_helper'

RSpec.describe 'Weather Facade' do
    it "returns daily weather for a location", :vcr do
        latitude = 39.390897
        longitude = -99.066067
        search = WeatherFacade.get_forecast(latitude, longitude)
        expect(search).to be_a Array
        expect(search.count).to eq(8)
        search.each do |s|
            expect(s).to be_a Weather
        end
    end

end