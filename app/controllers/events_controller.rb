class EventsController < ApplicationController
  def index
    @events = NationalParkFacade.all_park_events(params[:park_id], params[:start], params[:finish])
    @park = NewPark.find_by(park_code: params[:park_id])

    if @events.empty?
      flash.now[:notice] = 'No events available for this park.'
    end
  end

  def show
    if current_user.nil?
      @park = NewPark.find_by(id: params[:park_id])
      @event = NationalParkFacade.get_single_event(params[:id])
    else
      @user = User.find(session[:user_id])
      @park = NewPark.find_by(id: params[:park_id])
      @event = NationalParkFacade.get_single_event(params[:id])
    end
  end

private
  def event_params
    params.require(:new_event).permit(:location, :description, :name, :date, :time, :event_code, :free, :id, :fee_info, :latitude, :longitude, :type_of_event)
  end
end
