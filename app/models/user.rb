class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :social_security_number,
    presence: true,
    length: { is: 9 }
end
