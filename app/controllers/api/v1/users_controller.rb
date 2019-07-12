class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user).serialized_json, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  def index
    render json: UserSerializer.new(User.all).serialized_json, status: 200

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :ssn)
  end
end
