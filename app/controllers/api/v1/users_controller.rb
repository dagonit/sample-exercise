class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: user 
    else
      render json: user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params[:social_security_number].delete!("-") if params[:social_security_number].include?("-")
    params.permit(:email, :first_name, :last_name, :social_security_number)
  end
end