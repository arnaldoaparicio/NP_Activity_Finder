class ParksController < ApplicationController
  def index
    @parks = NationalParkFacade.get_parks_by_state(params[:state])
  end

  def show
    if NewPark.where(id: params[:id]).empty?
      @park = NationalParkFacade.one_park(params[:park_code])

      NewPark.find_or_create_by!(address: @park.address, closed_day: @park.closed_day, description: @park.description,
                                 directions_website: @park.directions_website, email: @park.email, entrance_fees: @park.entrance_fees,
                                 latitude: @park.latitude, longitude: @park.longitude, name: @park.name,
                                 operating_hours: @park.operating_hours, park_code: @park.park_code, phone_number: @park.phone_number, photos: @park.photos)
    else
      @park = NewPark.find(params[:id])
    end
  end

  private

  def park_params
    params.permit(:name, :description, :park_code, :latitude, :longitude, :phone_number, :email, :entrance_fees,
                  :directions_website, :closed_day, :operating_hours, :address, :photos)
  end
end
