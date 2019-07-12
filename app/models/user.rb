class User < ApplicationRecord
  attr_encrypted :ssn, key: ENV["key"]
  validates_presence_of :first_name,
                        :last_name,
                        :email,
                        :encrypted_ssn,
                        :encrypted_ssn_iv
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
