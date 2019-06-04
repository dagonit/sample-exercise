class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :social_security_number
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_format_of :social_security_number, with: /\d{9}/
end