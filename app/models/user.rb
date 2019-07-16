class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :social_security_number,
    presence: true,
    format: { with: /[0-9]{3}([-]?)[0-9]{2}\1[0-9]{4}/ }
end
