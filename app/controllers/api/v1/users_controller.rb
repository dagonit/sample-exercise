class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json
  end

  def create
    user = User.new(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      social_security_number: params[:social_security_number]
      )
    if user.save
      render json: user.to_json
    else
      render json: {message: 'Error'}
    end  
  end
end