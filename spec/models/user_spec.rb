require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
    it {should validate_presence_of :email}
    it {should validate_presence_of :encrypted_ssn}
    it {should validate_presence_of :encrypted_ssn_iv}
  end

  context 'email validation' do
    describe "when email format is invalid" do
      user = User.new(first_name: "John", last_name: "Smith", ssn: "000-00-0000")
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).not_to be_valid
        end
      end
    end

    describe "when email format is valid" do
      it "should be a valid user" do
        user = User.new(first_name: "John", last_name: "Smith", ssn: "000-00-0000", email: "email@example.com")
        expect(user).to be_valid
      end
    end
  end

end
