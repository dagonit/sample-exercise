class Api::V1::UsersController < ApplicationController
  before_action :clean_ssn_params, only: [:create]

  def index
    users = User.all
    render json: users.to_json
  end

  def create
    user = User.new(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      social_security_number: @clean_ssn
      )
    if user.save
      render json: user.to_json
    else
      render json: {message: 'Error'}
    end  
  end
end

private
    def clean_ssn_params
      if params[:social_security_number]
        @clean_ssn = params[:social_security_number].gsub(/[-_]/, '-' => '')
      end
    end