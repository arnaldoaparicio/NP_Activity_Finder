class UserNewEventsController < ApplicationController


    def create 
        @user = User.find(params[:user_id])
        @event = NewEvent.find_by(id: params[:event_id])
        @new_event = UserNewEvent.find_or_create_by(user_id: @user.id, new_event_id: @event.id)
        redirect_to user_path(@user)
    end

private

    def new_event_params
        params.permit(:new_event_id, :user_id  )
    end

end