require 'rails_helper'
require 'pry'

RSpec.describe NationalParkFacade do 
    it "returns parks by state code" do 

        state = 'md'
        search = NationalParkFacade.get_parks_by_state(state)
        expect(search).to be_a Array
    end

end