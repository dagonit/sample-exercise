require 'rails_helper'

describe 'User API' do
  it 'can return list of all users in database' do
    user_1 = User.create(first_name: "Abdulla", last_name: "Qudrat", email: "aqudrat638@gmail.com", social_security_number: "555555555")
    user_2 = User.create(first_name: "Eric", last_name: "Conejo", email: "eman@yahoo.com", social_security_number: "344553535")
    user_3 = User.create(first_name: "Lisa", last_name: "Champion", email: "lchamp111@gmail.com", social_security_number: "999999999")

    get '/api/v1/users'
    
    users = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(users).to be_a(Array)
    expect(users.count).to eq(3)
    
    expect(users[0]).to be_a(Hash)
    expect(users[0]).to have_key(:id)
    expect(users[0]).to have_key(:first_name)
    expect(users[0][:first_name]).to eq(user_1.first_name)
    expect(users[0]).to have_key(:last_name)
    expect(users[0][:last_name]).to eq(user_1.last_name)
    expect(users[0]).to have_key(:email)
    expect(users[0][:email]).to eq(user_1.email)
    expect(users[0]).to have_key(:social_security_number)
    expect(users[0][:social_security_number]).to eq(user_1.social_security_number)

    expect(users[1]).to be_a(Hash)
    expect(users[1]).to have_key(:id)
    expect(users[1]).to have_key(:first_name)
    expect(users[1][:first_name]).to eq(user_2.first_name)
    expect(users[1]).to have_key(:last_name)
    expect(users[1][:last_name]).to eq(user_2.last_name)
    expect(users[1]).to have_key(:email)
    expect(users[1][:email]).to eq(user_2.email)
    expect(users[1]).to have_key(:social_security_number)
    expect(users[1][:social_security_number]).to eq(user_2.social_security_number)

    expect(users[2]).to be_a(Hash)
    expect(users[2]).to have_key(:id)
    expect(users[2]).to have_key(:first_name)
    expect(users[2][:first_name]).to eq(user_3.first_name)
    expect(users[2]).to have_key(:last_name)
    expect(users[2][:last_name]).to eq(user_3.last_name)
    expect(users[2]).to have_key(:email)
    expect(users[2][:email]).to eq(user_3.email)
    expect(users[2]).to have_key(:social_security_number)
    expect(users[2][:social_security_number]).to eq(user_3.social_security_number)
  end
end