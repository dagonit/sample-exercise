class User < ApplicationRecord
  # Encryption 
  attr_encrypted :ssn, key: Base64.decode64(ENV['ENCRYPT_KEY'])
  # Validations 
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :ssn
  validates_length_of :ssn, is: 9

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end 
