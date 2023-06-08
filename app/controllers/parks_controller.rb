class ParksController < ApplicationController
  def index
    @parks = NationalParkFacade.get_parks_by_state(params[:state])
  end

  def show
    @park = NationalParkFacade.one_park(params[:park_code])
  end
end
