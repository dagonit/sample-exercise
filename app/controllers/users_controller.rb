class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
      if @user.save
        render json: @user
      else
        render :json => { :errors => @user.errors.full_messages }, :status => 400
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :social_security_number, :email)
  end
end
