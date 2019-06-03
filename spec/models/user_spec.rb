require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:social_security_number)}
    it { should validate_length_of(:social_security_number).is_equal_to(9)}
    it { should allow_value("email@address.com").for(:email) }
    it { should_not allow_value("email").for(:email) }
  end
end
