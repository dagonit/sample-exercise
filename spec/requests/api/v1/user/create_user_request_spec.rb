require 'rails_helper'

describe 'User API' do
  it 'can create a user with required parameters' do

    post '/api/v1/users?first_name=Abdulla&last_name=Qudrat&email=aqudrat638@gmail.com&social_security_number=555555555'
    
    user_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(user_response).to be_a(Hash)
    expect(user_response).to have_key(:id)
    expect(user_response).to have_key(:first_name)
    expect(user_response[:first_name]).to eq("Abdulla")
    expect(user_response).to have_key(:last_name)
    expect(user_response[:last_name]).to eq("Qudrat")
    expect(user_response).to have_key(:email)
    expect(user_response[:email]).to eq("aqudrat638@gmail.com")
    expect(user_response).to have_key(:social_security_number)
    expect(user_response[:social_security_number]).to eq("555555555")  
  end
  it 'fails to create a user with lack of required parameters' do

    post '/api/v1/users?first_name=Abdulla&last_name=Qudrat&email=aqudrat638@gmail.com'

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(user_response).to be_a(Hash)
    expect(user_response).to have_key(:message)
    expect(user_response[:message]).to eq("Error")
  end
  it 'can create a user with dashes in social security' do

    post '/api/v1/users?first_name=Abdulla&last_name=Qudrat&email=aqudrat638@gmail.com&social_security_number=555-55-5555'
    
    user_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(user_response).to be_a(Hash)
    expect(user_response).to have_key(:id)
    expect(user_response).to have_key(:first_name)
    expect(user_response[:first_name]).to eq("Abdulla")
    expect(user_response).to have_key(:last_name)
    expect(user_response[:last_name]).to eq("Qudrat")
    expect(user_response).to have_key(:email)
    expect(user_response[:email]).to eq("aqudrat638@gmail.com")
    expect(user_response).to have_key(:social_security_number)
    expect(user_response[:social_security_number]).to eq("555555555")  
  end
end