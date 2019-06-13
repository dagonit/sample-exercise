require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:social_security_number) }
    it { should validate_uniqueness_of(:social_security_number) }
    it { should validate_length_of(:social_security_number).is_equal_to(9)}
    
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it 'should validate format of email' do
      bad_email_info = {first_name: "Billy", 
                   last_name: "Joel", 
                   social_security_number: 123456789,
                   email: "email"}

      good_email_info = {first_name: "Billy", 
                   last_name: "Joel", 
                   social_security_number: 123456789,
                   email: "email@gmail.com"}

      bad_user = User.create(bad_email_info)
      good_user = User.create(good_email_info)

      expect(bad_user.id).to eq(nil)
      expect(good_user.id).to be_truthy
    end 

  end
end
