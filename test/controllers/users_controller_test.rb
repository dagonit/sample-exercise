require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'it can make a POST request to create a user' do
    params = { first_name: "First", 
              last_name: "Last", 
              email: "first@email.com", 
              social_security_number: "111111111" }
    post users_url, params: params
    new_user = JSON.parse(@response.body, symbolize_names: true)
    user = User.last
    assert_response :success
    assert_equal user.id, new_user[:id]
    assert_equal user.first_name, new_user[:first_name]
    assert_equal user.last_name, new_user[:last_name]
    assert_equal user.email, new_user[:email]
    assert_equal user.social_security_number, new_user[:social_security_number]
  end
  
  test 'invalid POST will not create user' do
    post users_url
    assert_equal 0, User.count
    assert_equal 400, @response.status
  end
end