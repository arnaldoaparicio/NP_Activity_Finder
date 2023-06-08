class ParksController < ApplicationController

    def index 
        @parks = NationalParkFacade.get_parks_by_state(params[:state])
        
    end

end