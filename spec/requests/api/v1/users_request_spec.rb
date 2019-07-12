require 'rails_helper'

RSpec.describe "Users API", :type => :request do
  context 'with valid user information' do
    it 'can create a new user' do
      user_params = { first_name: "John", last_name: "Smith", email: "email@example.com", ssn: "000-00-0000"}

      post "/api/v1/users", params: {user: user_params}
      user = User.last

      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")
      expect(user.first_name).to eq(user_params[:first_name])
    end

    it 'returns the newly created user' do
      user_params = { first_name: "John", last_name: "Smith", email: "email@example.com", ssn: "000-00-0000"}

      post "/api/v1/users", params: {user: user_params}
      expect(response).to have_http_status(201)
    end
  end

  context "with invalid user information" do
    it 'cannot create a user' do
      user_params = { first_name: "John", last_name: "Smith", email: "email@example.com"}
      post "/api/v1/users", params: {user: user_params}

      expect(response.content_type).to eq("application/json")
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)).to have_key("errors")

    end
  end

  it 'returns an index of all users' do
    users = create_list(:user, 3)

    get "/api/v1/users"
    response_body = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(response_body.size).to eq(3)
    expect(response_body[0]["first_name"]).to eq(users[0].first_name)
  end




end