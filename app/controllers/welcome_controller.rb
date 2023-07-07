class WelcomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    # @amenities = NationalParkFacade.get_amenities
  end
end
