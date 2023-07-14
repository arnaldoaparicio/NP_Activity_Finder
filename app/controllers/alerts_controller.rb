class AlertsController < ApplicationController
  def index
    @alerts = NationalParkFacade.get_alerts(params[:park_code], params[:state])
    require 'pry'; binding.pry
  end
end
