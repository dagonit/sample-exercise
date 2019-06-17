class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render status: 201, json: user
    else
      render status: 409, json: credentials_conflict
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :social_security_number)
  end
end
