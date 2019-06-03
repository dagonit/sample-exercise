class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  validates :social_security_number, presence: true, length: { is: 9 }
  validates :email, presence: true, email: true
end
