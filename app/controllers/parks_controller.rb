class ParksController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    # binding.pry

    @parks = NationalParkFacade.get_parks_by_state(params[:state])
  end

  def show
    @user = User.find_by(id: session[:user_id])
    if NewPark.where(id: params[:id]).empty? && NewPark.where(park_code: params[:park_code]).empty?
      @park = NationalParkFacade.one_park(params[:park_code])
      n = NewPark.new(address: @park.address, closed_day: @park.closed_day, description: @park.description,
                      directions_website: @park.directions_website, email: @park.email, entrance_fees: @park.entrance_fees,
                      latitude: @park.latitude, longitude: @park.longitude, name: @park.name,
                      operating_hours: @park.operating_hours, park_code: @park.park_code, phone_number: @park.phone_number, photos: @park.photos)
      n.save
      # binding.pry
      @park = NewPark.find_by(id: n.id)     
      @weather = WeatherFacade.get_forecast(@park.latitude, @park.longitude)
      

    else

      @park = NewPark.find_by(id: params[:id]) || NewPark.find_by(park_code: params[:park_code])
      @weather = WeatherFacade.get_forecast(@park.latitude, @park.longitude)

    end
  end

  def park_comments
    @comments = Comment.park_comments(params[:park_id])
  end

  private

  def park_params
    params.permit(:name, :description, :park_code, :latitude, :longitude, :phone_number, :email, :entrance_fees,
                  :directions_website, :closed_day, :operating_hours, :address, :photos)
  end
end
