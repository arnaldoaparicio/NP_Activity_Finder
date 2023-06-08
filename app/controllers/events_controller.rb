class EventsController < ApplicationController
  def index
    @events = NationalParkFacade.all_park_events(params[:park_id], params[:start], params[:finish])
  end
end