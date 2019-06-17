require 'rails_helper'

describe "Users API" do
  it "returns a user upon valid user creation" do
    post "/api/v1/users", params: {first_name: "John",
                                   last_name: "Doe",
                                   email: "jdoe@email.com",
                                   social_security_number: "123456789"}
    expect(response).to be_successful
    expect(response.status).to eq(201)
    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:first_name]).to eq("John")
    expect(body[:last_name]).to eq("Doe")
    expect(body[:email]).to eq("jdoe@email.com")
    expect(body[:social_security_number]).to eq(123456789)
  end

  it "returns an error code with invalid user creation" do
    #user tries to register without a last name
    post "/api/v1/users", params: {first_name: "John",
                                   email: "jdoe@email.com",
                                   social_security_number: "123456789"}
    expect(response).to_not be_successful
    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:error]).to eq("User could not be saved with those credentials.")
    expect(response.status).to eq(409)
  end
end
