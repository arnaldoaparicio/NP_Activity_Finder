class CommentsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @event = UserNewEvent.find(params[:user_new_event_id])
    @comments = @event.comments
  end

  def show; end

  def new
    @user = User.find(params[:user_id])
    @event = UserNewEvent.find(params[:user_new_event_id])
    @comment = Comment.new
    @all_user_events = @user.user_new_events
  end

  def create
    @user = User.find(params[:user_id])
    @event = UserNewEvent.find(params[:user_new_event_id])
    @all_user_events = @user.user_new_events
    @comment = @event.comments.new(comment_params)
    @comment.save
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(session[:user_id])
    @event = UserNewEvent.find(params[:user_new_event_id])

    @comment = @event.comments.find(params[:id])
    @all_user_events = @user.user_new_events
  end

  def update
    @user = User.find(session[:user_id])
    @event = UserNewEvent.find(params[:user_new_event_id])
    @comment = @event.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to "/users/#{@user.id}/parks/#{@event.new_park.id}/events/#{@event.new_event.id}/user_new_events/#{@event.id}/comments"
  end

  def destroy
    @user = User.find(session[:user_id])
    @event = UserNewEvent.find(params[:user_new_event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to "/users/#{@user.id}/parks/#{@event.new_park.id}/events/#{@event.new_event.id}/user_new_events/#{@event.id}/comments"
  end

  private

  def comment_params
    params.permit(:body, :user_new_event_id, :created_at, :updated_at)
  end
end
