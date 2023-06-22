class CommentsController < ApplicationController

    def index 
        # @comments = Comment.all
        @event = UserNewEvent.find(params[:user_new_event_id])
        @comments = @event.comments
    end

    def show

    end

    def new
        @user = User.find(params[:user_id])
        @event = UserNewEvent.find(params[:user_new_event_id])
        @comment = Comment.new
        @all_user_events = @user.user_new_events
    end

    def create 
        
        @user = User.find(params[:user_id])
        @event = UserNewEvent.find(params[:user_new_event_id])
        # @comment = Comment.new(comment_params)
        @all_user_events = @user.user_new_events
        @comment = @event.comments.new(comment_params)
        # @comment.user_new_event_id = @event.id
        @comment.save
        redirect_to user_path(@user)
    end

    private 

    def comment_params
        params.permit(:body, :user_new_event_id, :created_at, :updated_at)
    end

end