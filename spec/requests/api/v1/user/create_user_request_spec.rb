require 'rails_helper'

describe 'User API' do
  it 'can create a user with required parameters' do

    get '/api/v1/user?first_name=Abdulla&last_name=Qudrat&email=aqudrat638@gmail.com&social_security_number=555555555'

    response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end