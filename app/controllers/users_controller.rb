class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :social_security_number)
  end
end
