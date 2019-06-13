require 'rails_helper'

describe "User" do
  context "Create" do
    it 'can be created with good credentials' do
      user_credentials = {first_name: "Billy", 
                          last_name: "Joel", 
                          social_security_number: "123456789",
                          email: "email@gmail.com"}
      post api_v1_users_path(user_credentials)

      user = User.find_by(social_security_number: "123456789")
      expect(response.body).to include(user.social_security_number)
    end

    it 'cannot be created with good credentials' do
      user_credentials = {first_name: "Billy", 
                          last_name: "Joel", 
                          social_security_number: "123456789",
                          email: "email@gmail.com"}
      post api_v1_users_path(user_credentials)

      user = User.find_by(social_security_number: "123456789")
      expect(response.body).to include(user.social_security_number)
    end

    it 'can be created with hyphenated social security number' do
      user_credentials = {first_name: "Billy", 
                          last_name: "Joel", 
                          social_security_number: "123-45-6789",
                          email: "email@gmail.com"}

      post api_v1_users_path(user_credentials)

      user = User.find_by(social_security_number: "123456789")
      
      expect(response.body).to include(user.social_security_number)
    end
  end
  
end
