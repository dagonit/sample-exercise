require 'rails_helper'

RSpec.describe UsersController, type: :contoller do
  
  context 'VALID user call to CREATE' do
    it 'a user can be successfully created' do
      expect(User.create!(first_name: 'kendall', last_name: 'willard', email: 'kcw@test.com', social_security_number: '123-45-6789')).to be_valid     
    end
  end

  context 'INVALID email call to user CREATE. This test was expected to fail. This means the email validation was tripped and an incorrect email numbered was entered in this test. This test is working as designed.' do
    it 'The email must be in corect format: aaa@bbb.ccc' do
      user = User.create!(first_name: 'kendall', last_name: 'willard', email: 'kcwtest.com', social_security_number: '123-45-6789')
    end
  end

  context 'INVALID social security call to user CREATE. This test was expected to fail. This means the social security validation was tripped and an incorrect social security numbered was entered in this test. This test is working as designed.' do
    it 'The social must be in corect format: 000-00-0000 or 000000000' do
      user = User.create!(first_name: 'kendall', last_name: 'willard', email: 'kcw@test.com', social_security_number: '123-454-6789')
    end
  end

end