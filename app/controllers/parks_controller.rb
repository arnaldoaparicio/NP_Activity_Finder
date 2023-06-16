class ParksController < ApplicationController
  def index
    @parks = NationalParkFacade.get_parks_by_state(params[:state])
  end

  def show
    # @park = NationalParkFacade.one_park(params[:park_code])
    if Park.where(id: params[:id]).empty?
      @park = NationalParkFacade.one_park(params[:park_code])
      @park.save
    else 
      @park = Park.find(params[:id])
    end
  end


  private 

  def park_params
    params.permit(:name, :description, :park_code, :latitude, :longitude, :phone_number, :email, :entrance_fees, :directions_website, :closed_day, :operating_hours, :address, :photos)
  end
end
