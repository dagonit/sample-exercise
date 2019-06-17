require 'rails_helper'

describe "Users API" do
  it "returns a user upon valid user creation" do
    post "/api/v1/users", params: {first_name: "John",
                                   last_name: "Doe",
                                   email: "jdoe@email.com",
                                   social_security_number: "123456789"}
    expect(response.status).to eq(201)
    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:first_name]).to eq("John")
    expect(body[:last_name]).to eq("Doe")
    expect(body[:email]).to eq("jdoe@email.com")
    expect(body[:social_security_number]).to eq(123456789)
  end

  it "returns an error code with invalid user creation" do
    #user tries to register with invalid SSN
    post "/api/v1/users", params: {first_name: "John",
                                   last_name: "Doe",
                                   email: "jdoe@email.com",
                                   social_security_number: "456789"}
    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:error]).to eq("User could not be saved with those credentials.")
    expect(response.status).to eq(409)
  end

  it "returns an index of users" do
    User.create(first_name: "John", last_name: "Doe", email: "jdoe@email.com", social_security_number: "123456789")
    User.create(first_name: "Jane", last_name: "Smiley", email: "jsmiley@email.com", social_security_number: "987654321")
    User.create(first_name: "Barack", last_name: "Obama", email: "mrprez@email.com", social_security_number: "192837465")
    get "/api/v1/users"
    expect(response.status).to eq(201)
    body = JSON.parse(response.body, symbolize_names: true)
    expect(body.count).to eq(3)
  end
end
