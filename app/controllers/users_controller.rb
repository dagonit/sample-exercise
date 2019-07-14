class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      render json: @user.errors, status: 422
    else 
      render json: @user, status: 200
    end
  end


  private

  def user_params
    # params.require(:user).permit(:first_name, :last_name, :email, :social_security_number)
    params.permit(:first_name, :last_name, :email, :social_security_number)
  end
end
