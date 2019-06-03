class Api::V1::UsersController < ApplicationController
  def create
    render json: User.create(user_params), status: 201
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :social_security_number)
  end
end
