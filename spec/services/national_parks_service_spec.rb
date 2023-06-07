require 'rails_helper'
require 'pry'

RSpec.describe NationalParkService do 
    it "returns all parks in a given state" do 
        state = 'MD'

        search = NationalParkService.parks_by_state(state)
        expect(search).to be_a Hash
    end

end