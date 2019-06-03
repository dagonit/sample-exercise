require 'rails_helper'

describe 'as a user' do
  it 'creates a new user' do
    params = {
      first_name: "John",
      last_name: "Doe",
      email: "johndoe@gmail.com",
      social_security_number: "123456789"
    }

    post "/api/v1/users?first_name=#{params[:first_name]}&last_name=#{params[:last_name]}&email=#{params[:email]}&social_security_number=#{params[:social_security_number]}"

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(user[:first_name]).to eq(params[:first_name])
    expect(user[:last_name]).to eq(params[:last_name])
    expect(user[:email]).to eq(params[:email])
    expect(user[:social_security_number]).to eq(params[:social_security_number])
    expect(User.all.count).to eq(1)
  end
end
