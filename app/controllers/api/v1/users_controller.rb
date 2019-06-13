class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: user 
    else
      render json: user.errors.full_messages.to_sentence
    end
  end

  def index
    render json: User.all
  end

  private

  def user_params
    params[:ssn].delete!("-") if params[:ssn].include?("-")
    params.permit(:email, :first_name, :last_name, :ssn)
  end
end