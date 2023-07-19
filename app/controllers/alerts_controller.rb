class AlertsController < ApplicationController
  def index
    @alerts = NationalParkFacade.get_alerts(params[:park_code])
  end
end
