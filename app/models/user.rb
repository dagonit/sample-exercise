class User < ApplicationRecord
  attr_encrypted :ssn, key: ENV["key"]
  validates_presence_of :first_name,
                        :last_name,
                        :encrypted_ssn,
                        :encrypted_ssn_iv
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: true,
            presence: true

  validates :ssn, length: {is: 9},
                  presence: true,
                  format: { with: /\A\d+\z/, message: "should only have digits."}

  before_validation(on: :create) do
    if self.ssn
      self.ssn = self.ssn.delete('-')
    end
  end
end
