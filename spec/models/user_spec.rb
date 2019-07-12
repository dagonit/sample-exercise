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
      it "should be an invalid user" do
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
        user = User.new(first_name: "John", last_name: "Smith", ssn: "123456789", email: "email@example.com")
        expect(user).to be_valid
      end
    end
  end

  context 'social security number validation' do
    describe 'when it does not have exactly 9 digits' do
      it 'is an invalid ssn invalid' do
        user = User.new(ssn: "0000", first_name: "John", last_name: "Smith", email: "email@example.com")
        expect(user).to_not be_valid
      end
    end

    describe 'when it does have 9 digits' do
      it 'is a valid ssn' do
        user = User.new(ssn: "123456789", first_name: "John", last_name: "Smith", email: "email@example.com")
        expect(user).to be_valid

        user2 = User.new(ssn: "123-45-6789", first_name: "John", last_name: "Smith", email: "email@example.com")
        expect(user2).to be_valid

      end
    end

    describe 'when it does not contain only numbers' do
      it 'is an invalid ssn' do
        user = User.new(ssn: "AAAAAAAAA", first_name: "John", last_name: "Smith", email: "email@example.com")
        expect(user).to_not be_valid
      end
    end
  end

end
