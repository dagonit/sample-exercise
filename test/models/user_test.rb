require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test 'a user can be valid' do
    user = User.create(first_name: "First", last_name: "Last", email: "first@email.com", social_security_number: "111111111")
    assert user.valid?
  end
  
  test 'a user can be valid with SSN in either format' do
    user = User.create(first_name: "First", last_name: "Last", email: "first@email.com", social_security_number: "111111111")
    assert user.valid?
    
    user_with_hyphens = User.create(first_name: "First", last_name: "Last", email: "first@email.com", social_security_number: "111-11-1111")
    assert user_with_hyphens.valid?
  end
  
  test 'a user cannot be created without all fields' do
    no_first_name = User.create(last_name: "Last", email: "first@email.com", social_security_number: "111111111")
    refute no_first_name.valid?
    no_last_name = User.create(first_name: "First", email: "first@email.com", social_security_number: "111111111")
    refute no_last_name.valid?
    no_email = User.create(first_name: "First", last_name: "Last", social_security_number: "111111111")
    refute no_email.valid?
    no_ssn = User.create(first_name: "First", last_name: "Last", email: "first@email.com")
    refute no_ssn.valid?
  end
  
  test 'a user cannot be created with invalid email address' do
    user = User.create(first_name: "First", last_name: "Last", email: "not_an_email", social_security_number: "111111111")
    refute user.valid?
  end
  
  test 'a user cannot be created with an invalid SSN' do
    user = User.create(first_name: "First", last_name: "Last", email: "first@email.com", social_security_number: "111")
    refute user.valid?
    
    user_2 = User.create(first_name: "First", last_name: "Last", email: "first@email.com", social_security_number: "111-111111")
    refute user_2.valid?
  end
end
