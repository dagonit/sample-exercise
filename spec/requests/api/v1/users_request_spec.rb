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

    describe 'social security number format' do
      it 'can accept ssn with dashes and create a new user' do
        user_params = { ssn: "000-00-0000", first_name: "John", last_name: "Smith", email: "email@example.com"}
        post "/api/v1/users", params: {user: user_params}
        expect(response).to have_http_status(201)
        expect(User.last.first_name).to eq("John")
      end

      it 'can accept ssn without dashes and create a new user' do
        user_params = { ssn: "000000000", first_name: "Jack", last_name: "Smith", email: "email@example.com"}
        post "/api/v1/users", params: {user: user_params}
        expect(response).to have_http_status(201)
        expect(User.last.first_name).to eq("Jack")
      end

      it 'cannot accept invalid ssn numbers' do
        user1_params = { ssn: "000", first_name: "Jack", last_name: "Smith", email: "email@example.com"}
        post "/api/v1/users", params: {user: user1_params}
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)["errors"][0]).to eq("Ssn is the wrong length (should be 9 characters)")


        user2_params = { ssn: "AAAAAAAAA", first_name: "Jack", last_name: "Smith", email: "email@example.com"}
        post "/api/v1/users", params: {user: user2_params}
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)["errors"][0]).to eq("Ssn should only have digits.")
      end
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
    user1 = User.create(first_name: "John", last_name: "Smith", email: "js@example.com", ssn: "123456789")
    user2 = User.create(first_name: "Jack", last_name: "Test", email: "jack@example.com", ssn: "123-45-6789")
    user3 = User.create(first_name: "Jill", last_name: "Test2", email: "jill@example.com", ssn: "000000000")

    get "/api/v1/users"
    response_body = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(response_body.size).to eq(3)
    expect(response_body[0]["first_name"]).to eq(user1.first_name)
  end




end