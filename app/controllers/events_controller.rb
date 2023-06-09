class EventsController < ApplicationController
  def index
    @events = NationalParkFacade.all_park_events(params[:park_id], params[:start], params[:finish])

    if @events.empty?
      flash[:notice] = "No events available for this park."
    end

  end
end