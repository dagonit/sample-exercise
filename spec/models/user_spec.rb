require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context "invalid attributes" do
      it "is invalid without a first_name" do
        user = User.new(last_name: "Qudrat", email: "aqudrat638@gmail.com", social_security_number: "555555555")
        expect(user).to be_invalid
      end
      it "is invalid without a last_name" do
        user = User.new(first_name: "Abdulla", email: "aqudrat638@gmail.com", social_security_number: "555555555")
        expect(user).to be_invalid
      end
      it "is invalid without an email" do
        user = User.new(first_name: "Abdulla", last_name: "Qudrat", social_security_number: "555555555")
        expect(user).to be_invalid
      end
      it "is invalid without a social_security_number" do
        user = User.new(first_name: "Abdulla", last_name: "Qudrat", email: "aqudrat638@gmail.com")
        expect(user).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do 
        user = User.new(first_name: "Abdulla", last_name: "Qudrat", email: "aqudrat638@gmail.com", social_security_number: "555555555")
        expect(user).to be_valid
      end
    end
    context "validate social security number limitations" do
      it "is invalid with LESS than 9 characters" do 
        user = User.new(first_name: "Abdulla", last_name: "Qudrat", email: "aqudrat638@gmail.com", social_security_number: "55555555")
        expect(user).to be_invalid
      end
      it "is invalid with MORE than 9 characters" do 
        user = User.new(first_name: "Abdulla", last_name: "Qudrat", email: "aqudrat638@gmail.com", social_security_number: "5555555555")
        expect(user).to be_invalid
      end
    end
    context "validate email limitations" do
      it "is invalid with incorrect email format" do 
        user = User.new(first_name: "Abdulla", last_name: "Qudrat", email: "aqudrat638gmail.com", social_security_number: "555555555")
        expect(user).to be_invalid
      end
      it "is invalid with incorrect email format" do 
        user = User.new(first_name: "Abdulla", last_name: "Qudrat", email: "@gmail.com", social_security_number: "555555555")
        expect(user).to be_invalid
      end
      it "is invalid with incorrect email format" do 
        user = User.new(first_name: "Abdulla", last_name: "Qudrat", email: "aqudrat638@gmail", social_security_number: "555555555")
        expect(user).to be_invalid
      end
    end
  end
end
