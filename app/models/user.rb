class User < ApplicationRecord
  # Validations 
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :social_security_number
  validates_uniqueness_of :social_security_number
  validates_length_of :social_security_number, is: 9

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end 
