class UsersController < ApplicationController
  def index
    render json: User.all
  end
  
  def create
    user = User.create(user_params)
    if user.valid?
      render json: user, status: :created
    else
      render json: user.errors.messages, status: 400
    end
  end
  
  private
  
  def user_params
    params.permit(:first_name, :last_name, :email, :social_security_number)
  end
end