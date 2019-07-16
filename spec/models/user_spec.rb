require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.create(email: "test@gmail.com", first_name: "test_first_name", last_name: "test_last_name", social_security_number: "123-45-6789")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a social security number" do
    subject.social_security_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with an invalid email address" do
    subject.email = "invalid_email"
    expect(subject).to_not be_valid
  end

  it "is not valid with an invalid social security number" do
    subject.social_security_number = "123-45-678"
    expect(subject).to_not be_valid
  end

  it "is  valid with a social security number without hyphens" do
    subject.social_security_number = "123456789"
    expect(subject).to be_valid
  end

  it "is not valid with a social security number in an inconsistent format" do
    subject.social_security_number = "123-456789"
    expect(subject).to_not be_valid
  end

end
