class UserNewParksController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:user_id])
    @park = NewPark.find_by(id: params[:park_id])
    @user_new_park = UserNewPark.find_or_create_by(user_id: @user.id, new_park_id: @park.id)
    if @user_new_park.save
      redirect_to user_path(@user_new_park.user)
    else
      redirect_to user_path(@user_new_park.user)
    end
  end

  def destroy

    @user = User.find(params[:user_id])
    @park = NewPark.find_by(id: params[:park_id])
    @user_new_park = UserNewPark.find_by(user_id: @user.id, new_park_id: @park.id)
    @user_new_park.delete
    redirect_to user_path(@user)
  end

  private

  def user_new_park_params
    params.require(:user_new_park).permit(:user_id, :new_park_id)
  end
end
