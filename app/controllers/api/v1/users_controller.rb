class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: "Please try again", status: 422
    end
  end

  def index
    render json: User.all
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :social_security_number)
  end
end
