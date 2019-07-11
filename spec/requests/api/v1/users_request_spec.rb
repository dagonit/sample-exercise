require 'rails_helper'

RSpec.describe "Users API", :type => :request do
  it 'can create a new user' do
    user_params = { first_name: "John", last_name: "Smith", email: "email@example.com", ssn: "000-00-0000"}

    post "/api/v1/users", params: {user: user_params}
    user = User.last

    expect(response).to be_successful
    expect(user.first_name).to eq(user_params[:first_name])
  end



end